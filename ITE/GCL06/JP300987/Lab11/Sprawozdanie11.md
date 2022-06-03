**SPRAWOZDANIE 10**
**Wdrażąnie na zarządzalne kontenery: Kubernetes (1)**
##
**Instalacja klastra Kubernetes:**
Użycie poleceń zawartych na stronie:
-   [https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/)

Zaopatrzenie się w implementację stosu k8s: minikube:
`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
Przeprowadzenie instalacji poleceniem:
`sudo install minikube-linux-amd64 /usr/local/bin/minikube`
Wynik:
s1
Zainstalowana wersja:
s4

Zaopatrzenie się w polecenie kubectl:
Pobranie kubectl:
`curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
s5
Zainstalowanie kubectl:
`sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
s8

Uruchomienie Kubernetes'a poleceniem `minikube start`, pokazanie działającego kontenera:
s2
Pojawia się błąd, który należy zniwelować dodając użytkownika do grupy docker poleceniem:
`sudo usermod -aG docker $USER && newgrp docker`
s3

Sprawdzenie dostępu do klastra poleceniem `kubectl get po -A`:
s10
Dodanie aliasu poleceniem `alias kubectl="minikube kubectl --"`:
s11
Uruchomienie Dashboard poleceniem `minikube dashboard`:
s12
s13
##
**Analiza posiadanego kontenera:**
Aplikacja użyta w poprzednich projektach nie może zostać wykorzystana w tym ćwiczeniu, ponieważ jest to rozszerzenie innej aplikacji (nie jest to program samodzielny), w związku z czym nie można jej uruchomić w kontenerze. W ramach tego ćwiczenia został wykorzystany nginx.

Uruchomienie kontenera z nginx poleceniem `docker run --name nginx -p 80:80 -d nginx`:
s14

Wyświetlenie utworzonych kontenerów poleceniem `sudo docker ps`:
s15
##
**Uruchamianie oprogramowania:**
Kontener uruchomiony w minikubie zostanie automatycznie wyposażony w poda (`minikube kubectl run -- nginx --image=nginx --port=80 --labels app=nginx`):
s17

Przedstawienie, że pod działa poprawnie:
Dashboard:
s19

Kubectl (`kubectl get pods`):
s18

Wyprowadzenie portu poleceniem `kubectl port-forward nginx 2222:80`:
s21

Sprawdzenie działania:
s20
 


##

**Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie):**
Stworzenie pliku wdrożenia wraz z replikami d.yml:
s24
Zawartość:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jp-nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
```
Zaaplikowanie pliku (`kubectl apply -f d.yml`) oraz sprawdzenie działania podów (`kubectl get pods -o wide`):
s25
s26

Sprawdzenie w dashboard:
s27
