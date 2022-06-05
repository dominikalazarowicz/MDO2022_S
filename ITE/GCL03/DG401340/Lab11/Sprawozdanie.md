## Instalacja klastra Kubernetes
 * **Zaopatrz się w implementację stosu k8s: minikube**

Zaopatrzenie się w implementację: `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`  

 * **Przeprowadź instalację, wykaż poziom bezpieczeństwa instalacji**

Instalacja: `sudo install minikube-linux-amd64 /usr/local/bin/minikube`  
![](./screenshots/install_minikube.png)  
Sprawdzenie poprawności instalacji: `minikube version`  
![](./screenshots/success_install_minikube.png)  

 * **zaopatrz się w polecenie kubectl**  

Pobranie kubectl: `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`  
![](./screenshots/download_kubectl.png)  
Pobranie checksum kubectl: `curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"`  
Sprawdzenie checksum kubectl: `echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check`  
![](./screenshots/checksum_kubectl.png)  
Instalacja kubectl: `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`  
![](./screenshots/install_kubectl.png)  
Sprawdzenie wersji kubectl: `kubectl version --client`  
![](./screenshots/kubectl_version.png)  

 * **Uruchom Kubernetes, pokaż działający kontener/worker**

Aby poprawnie uruchomić Kubernetes, należy dodać użytkownika do nowo utworzonej grupy docker: `sudo groupadd docker`, `sudo usermod -aG docker $USER`, `newgrp docker`  
![](./screenshots/add_to_docker.png)  
![](./screenshots/add_user_docker.png)  
Uruchomienie Kubernetes: `minikube start`  
![](./screenshots/minikube_start.png)  
Sprawdzenie dostępu do klastra i dodanie aliasu:  `kubectl get po -A`, `alias kubectl="minikube kubectl --"`
![](./screenshots/alias.png)  

 * **Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność** 

Uruchomienie dashboardu:  `minikube dashboard`  
![](./screenshots/dashboard_run.png)  
![](./screenshots/dashboard.png)  
 
## Analiza posiadanego kontenera
Wybrana aplikacja na projekt nie nadaje się do pracy w kontenerze, ponieważ jest to plugin do gry Minecraft, którego nie da się odpalić jako osobna aplikacja w kontenerze. Dlatego też do wykonania tego zadania wybrano inny obraz kontenera, którym jest [itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server). 
   
## Uruchamianie oprogramowania
 * Kontener uruchomiony w minikubie zostanie automatycznie ubrany w pod.

Uruchomienie poda: `minikube kubectl run -- mc --image=itzg/minecraft-server --port 25565 --labels app=mc --env="EULA=TRUE"`. Ustawiona zmienna środowiskowa jest wymagana w celu poprawnego uruchomienia serwera minecraft.  
![](./screenshots/create_pod_mc.png)  
 * Przedstaw że pod działa (via Dashboard oraz kubectl)  

Via Dashboard:  
![](./screenshots/pod_mc_working.png)  
Via kubectl: `kubectl get pods`, `kubectl describe pod mc`  
![](./screenshots/cmd_working_pod.png)  
![](./screenshots/cmd_working_pod2.png)  
 * Wyprowadź port celem dotarcia do eksponowanej funkcjonalności

Wyprowadzenie portu: `kubectl port-forward mc 25565:25565`  
![](./screenshots/port_forward.png)  
 * Przedstaw komunikację z eskponowaną funkcjonalnością  

Przedstawienie funkcjonalności poprzez dodanie serwera do listy serwerów:  
![](./screenshots/add_server.png)  
![](./screenshots/server_working.png)  

## Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)
Utworzenie pliku wdrożenia razem z replikami [deployment.yml](./deployment.yml):  
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mc
spec:
  replicas: 2
  selector:
    matchLabels:
      app: mc
  template:
    metadata:
      labels:
        app: mc
    spec:
      containers:
      - name: mc
        image: itzg/minecraft-server
        ports:
        - containerPort: 25565
        env:
          - name: EULA
            value: "TRUE"
```
  
```kubectl apply``` na pliku: `kubectl apply -f deployment.yml` i sprawdzenie działania podów: `kubectl get pods`  
![](./screenshots/deploy_pods.png)  
![](./screenshots/deploy_pods_dashboard.png)  
