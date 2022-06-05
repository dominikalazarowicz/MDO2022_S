#  Piotr Wilkosz - 404121
## Sprawozdanie 11

### Instalacja klastra Kubernetes

Na początku dokonuję instalacji klastra. Dokonuję tego z oficjalnej strony producenta. Ze względu na liczne problemy i wynikające z tego przeprowadzane testy dokonuję tego łącznie dla 3 platform - Windows, Linux ARM64 oraz x64. Na zrzuach ekranu prezentuję na instalację na Ubuntu x64.

![Instalacja](img1/01-minikube-download.png)

![Instalacja](img1/02-minikube-install.png)

Kolejno uruchamiam minikube zaopatruję się w polecenie kubectl.

![Minikube start](img1/04-minikube-start.png)

![Kubectl](img1/03-kubctl.png)

Nastepnie uruchamian kubernetesa i wykazuję działający z nim kontener poprzez ``docker ps``.

![Docker ps](img1/12-docker-ps.png)

Następnie uruchamiam i prezentuję dashboard.

![Dashboard](img1/05-kub-dashboard.png)

### Analiza posiadanego kontenera

Na podstawie posiadanego dockerfile tworzę obraz. Następnie wypycham go na docker hub w zwiazku z wynikłymi kompilacjami.

Nie używam w tym przypadku artefaktu z pipelina gdyż zgodnie z wymaganiami jest on wypychany na npm registry. Dodatko pracuję na kilku platformach wieć zmiana w tym przypadku była by mocno problematycza.

![Docker build](img1/06-docker-build.png)

![Docker images](img1/07-docker-images.png)

![Docker hub](img1/00-docker-push.png)

Nastepnie wykazuję że aplikacja pracuje jako kontener. Jej zawartość wyprowadzam na porcie 5000.

![Docker ps](img1/08-app-as-container.png)
   
### Uruchamianie oprogramowania

Kolejno podejmuję próbę uruchomienia na stosie k8s. Niestety na tym etapie napotkałem na problemy które ~~uniemożliwiły mi kontynuację zadania~~ udało się już rozwiązać. 

<details>
  <summary>Detale byłego problemu</summary>

  ```
Związane są one z błędem ``CrashLoopBackOff`` podczas uruchamiania obrazu. Problem ten występuje w przypadku uruchamiania każdego obrazu opartego na Node, również przy czystym node:latest, na każdej z trzech uzywanych platform. Inne obrazy nie związane z NodeJS działają poprawnie.```

![Problems](img1/13-problems.png)

W związku z tym pozostała cześć zadania zostanie wykonana razem z kolejnymi etapami, po rozwiązaniu problemu.
  ```
</details>

Rozwiązaniem było uruchomienie servera bezpośrednio  poprzez ```node``` z paramterami z package.json zamiast ```npm start```.

Uruchomienie poda nastąpiło poniższym poleceniem, w którym specyfikuję używany obraz znadjujacy się na docker hub'ie we wskazanej wersji - ```beta```. Dodatkowo określam port i etykiety. Kolejno wyświetlam status podów poprzez cli oraz dashboard.

![kubectl pods](img2/201-get-pods.png)

![kubectl dashboard](img2/202-dashboard.png)

Kolejno przy pomocy polecenia ``kubectl port forward`` wyprowadzam port 8080 na port lokalny 5000 i wykazuję poprawne działanie aplikacji.

![kubectl port forward](img2/203-port-forwarding.png)
 
### Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

Rozpoczynam tworznie pliku YAML. Defniuję 3 repliki. Ustawiam obraz z wypchniętą wcześniej wersją aplikacji. Wyprowadzam port 8080.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-project
  labels:
    app: node-project
spec:
  replicas: 3
  selector:
    matchLabels:
      app: node-project
  template:
    metadata:
      labels:
        app: node-project
    spec:
      containers:
      - name: node-project-container
        image: pwilkosz99/pwilkosz-node.js.org:beta
        ports:
        - containerPort: 8080
```

Następnie wywołuje polecenie ```kubectl apply```

![kubectl apply](img2/204-kubectl-apply.png)

Po jego uruchomieniu w dashbordzie można zauważyć powstanie nowego deplotemnu. Powstaje jeden nowy replica set, zawierajacy 3 pody. Wraz z uruchomionym poporzednim pojedynczym podem łączenie uruchomione są 4 pody.

![dashboard final](img2/205-dashboard-final.png)