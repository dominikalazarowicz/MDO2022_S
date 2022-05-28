1. Instalacja minikube
Instalacja
![](kubectl_install.png)
Start
![](minikube_start.png)
2. Dashboard
Uruchomienie dashboarda
![](dashboard.png)
3. Deploy przykladowej aplikacji hello-world

kubectl create deployment hello --image=gcr.io/google-samples/hello-app:1.0
![](create_start_depl.png)

4. Exposowanie portow

kubectl expose deployment hello --type=NodePort --port=8080

5. Laczenie do aplikacji
![](laczenie.png)
