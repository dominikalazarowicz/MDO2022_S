## Instalacja klastra Kubernetes

- Zaopatrz się w implementację stosu k8s: minikube

  `Instalacja przez curl i program install na Manjaro Linux`

  ![](screeny/1a.png)

- zaopatrz się w polecenie kubectl

  ![](screeny/1b.png)

- Uruchom Kubernetes, pokaż działający kontener/worker

  ```
  minikube start
  ```

  ![](screeny/1c.png)

- Zmityguj problemy wynikające z wymagań sprzętowych lub odnieś się do nich (względem dokumentacji)

  `Kontener od razu ma nadaną nazwę zmiast losowej - celem tej operacji jest zablokowanie tworzenia więcej niż jednego kontenera minikube'a`

- Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność

  ```
  minikube dashboard
  ```

  ![](screeny/1d.png)

- Zapoznaj się z koncepcjami funkcji wyprowadzanych przez kubernetesa (pod, deployment itp)

  ~~A kto by to robił~~ Zapoznałem się :heavy_check_mark:

## Analiza posiadanego kontenera

- Zdefiniuj krok "Deploy" swojego projektu jako "Deploy to cloud":

  - Deploy zbudowanej aplikacji powinien się odbywać "na kontener"

    `Nie tworzyłem nowego kroku oraz nie modyfikowałem pipeline'a ponieważ juz działał w ten sposób`

  - Przygotuj obraz Docker ze swoją aplikacją

    `https://hub.docker.com/repository/docker/stanmarek/devops-golang-project`

  - Jeżeli wybrana aplikacja nie nadaje się do pracy w kontenerze i nie wyprowadza interfejsu funkcjonalnego przez sieć, wymień projekt na potrzeby tego zadania:

    - Minimum: obraz-gotowiec
    - Optimum: samodzielnie wybrany program, obraz zbudowany na jego bazie
    - Plan max: obraz wygenerowany wskutek pracy pipeline'u

    `Moja apka to plan max`

  - Wykaż, że wybrana aplikacja pracuje jako kontener

  ![](screeny/2a.png)

  `Konetner/aplikacja nasłuchuje na różnych endpointach (np. /ping, /login) ponieważ jest to mikroserwis. W tym czasie (zrzut ekranu powyżej) widoczne są logi uruchomieniowowe`

## Uruchamianie oprogramowania

- Uruchom kontener na stosie k8s

  ```
  minikube kubectl run -- devops-golang-microservice
  --image=stanmarek/devops-golang-project:910f2699b43392e699442711c15c92c2ed31abe7
  --port=9090 --labels app=devops-golang-microservice
  ```

- Kontener uruchomiony w minikubie zostanie automatycznie ubrany w pod.
- Przedstaw że pod działa (via Dashboard oraz kubectl)

  ```
  # kontenery z defaultowego namespace
  minikube kubectl -- get pods
  # wszystkie kontenery
  minikube kubectl -- get po -A
  ```

  ![](screeny/3a.png)
  ![](screeny/3b.png)
  `Tworzenie kontenera`
  ![](screeny/3c.png)
  `Działający kontener`
  ![](screeny/3cc.png)

- Wyprowadź port celem dotarcia do eksponowanej funkcjonalności

  ```
  kubectl port-forward devops-golang-microservice 2137:9090
  ```

  ![](screeny/3d.png)

- Przedstaw komunikację z eskponowaną funkcjonalnością

  ![](screeny/3e.png)
  ![](screeny/3f.png)
  ![](screeny/3g.png)
  ![](screeny/3h.png)

  `Po wykonaniu kilku requestów widać że przekierowany port był wykorzystany`

## Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

- Zapisanie wdrożenia jako plik YML

  ![](screeny/4a.png)

- Dodanie replik

  ```yaml
  apiVersion: apps/v1
  kind: Deployment
  metadata:
  name: devops-golang-microservice-deployment
  labels:
    app: devops-golang-microservice
  spec:
  replicas: 4
  selector:
    matchLabels:
      app: devops-golang-microservice
  template:
    metadata:
      labels:
        app: devops-golang-microservice
    spec:
      containers:
        - name: devops-golang-microservice
          image: stanmarek/devops-golang-project:910f2699b43392e699442711c15c92c2ed31abe7
          ports:
            - containerPort: 9090
  ```

- `kubectl apply` na pliku

  ```
  kubectl apply -f devops-golang-deployment.yaml
  ```

  ![](screeny/4b.png)
  `Obok pierwszego kontenera utworzone zostały 4 nowe zgodnie z plikiem deploymentu`
  ![](screeny/4c.png)
  ![](screeny/4d.png)
