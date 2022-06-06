# Sprawozdanie Lab11 i Lab12 Damian Zyznar ITE-GCL08

<br>

**Cel labortariów:** Wdrażanie na zarządzakne kontenery Kubernetes

</br>


# Instalacja klastra Kubernetes
Aby zaopatrzyć się w implementację stosu k8s: minikube potzrbne było narzędzie curl. Pierwszym krokiem była jego instalacja. Następnie pobrano i zainstalowano minikube'a

![minikube_install](../Lab11/screenshots/minikube_install.png)

Pobranie pakietów instalacyjnych kubectl, oraz sprawdzenie sumy kontrolnej, co znacząco wzmacnia bezpieczeństwo instalacji:

![kubectl_install](../Lab11/screenshots/kubectl_install.png)

Instalacja kubestl:

![kubectl_install2](../Lab11/screenshots/kubectl_install2.png)

Próba pierwszego uruchomienia minikube:

![error](../Lab11/screenshots/error.png)

Wykonano zaleconą operację dodania użytkownika do grupy docker i uruchomiono minikube.

![minikube_start](../Lab11/screenshots/minikube_start.png)

Wyświetlenie działających node'ów i pod'ów. Klaster składa się z jednego noda - master.

![kubectl_nodes](../Lab11/screenshots/kubectl_nodes.png)

Uruchomienie dashbord'u

![minikube_dashboard](../Lab11/screenshots/minikube_dashboard.png)

Największym wymaganiem sprzętowym do instalacji kubernetesa jest 20 GB wolnej przestrzeni dyskowej. Wymagania dotyczące procesora i pamięci RAM nie są zbyt wygórowane i zostaną spełnione przez dużą większość obecnych komputerów. Minikube potrzebuje również środowiska konteneryzajci, w tym przypadku jest to docker.

# Analiza posiadanego kontenera

Aplikacja używana we wcześniejszych laboratoriach jest napisania w Node.Js i podczas uruchomienia przykładowych skryptów udostępnia port 3000, więc aplikacja jak najbardziej nadaje się do wykonania tego laboratorium.

Utworzono następujący Dockerfile:

```
FROM node:latest

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY . .
EXPOSE 3000
CMD [ "node", "examples/content-negotiation"]
```

Uruchamiany tu jest przykładowy skrypt ```content-negotiation```, oraz udostępniany jest port 3000.

Build obrazu:

![docker_build](../Lab11/screenshots/docker_build.png)

Uruchomienie kontenera i przekierowanie portu 3000 z kontenera na port 49160 w localhost, oraz przedstawienie działania.

![docker_run](../Lab11/screenshots/docker_run.png)


# Uruchamianie oprogramowania

Utworzenie pliku definicji pod.yml dla aplikacji.

```
apiVersion: v1
kind: Pod

metadata:
  name: express
  labels:
    app: express

spec:
  containers:
    - name: express
      image: node-web-app
      imagePullPolicy: Never
      ports:
      - containerPort: 3000
      
```
Utworzono pod'a za pomocą polecenia ```kubectl -y apply -f pod.yml``` i sprawdzono jego działanie:
=-
![kubectl_error](../Lab11/screenshots/kubectl_error.png)

Pod nie działa. Jest to spowodowane tym, że w node, w którym obecnie pracujemy nie ma docker image o nazwie ```node-web-app```. Ustawienie w pliku definicji ```imagePullPolicy: Never``` mówi, że obraz nie będzie pobierany z internetu, tylko będzie poszukiwany w lokalnej bazie obrazów w aktualnym nodzie. Problem rozwiązano za pomocą optymalizacji przepływu pracy i uruchomienu docker build na podstawie utworzonego wcześniej ```Dockerfile```:

![error3](../Lab11/screenshots/error3.png)

Kolejnopodjęto kolejną próbę utworzenia Pod'a.

![kubectl_running](../Lab11/screenshots/kubectl_running.png)

Pod działa prawidłowo, dashboard:

![dashboard](../Lab11/screenshots/dashboard.png)

Kolejnym krokiem było wyprowadenie portu celem dotarcia do eksponowanej funkcjonalności i przedstawienie działania w przeglądarce.

![port_forward](../Lab11/screenshots/port_forward.png)

# Przekucie wdrożenia manualnego w plik wdrożenia

Utworzenie drugiego pliku Pod do wdrożenia z 3 replikami:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: express
  labels:
    app: express
spec:
  replicas: 3
  selector:
    matchLabels:
      app: express
  template:
    metadata:
      labels:
        app: express
    spec:
      containers:
      - name: express
        image: node-web-app
        imagePullPolicy: Never
        ports:
        - containerPort: 3000
```

Utworzenie Pod'a i przedstawienie działania:

![deployment](../Lab11/screenshots/deployment.png)