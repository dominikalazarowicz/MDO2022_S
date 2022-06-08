# Sprawozdanie 11

## Wdrażzanie na zarządzalne kontenery: Kubernetes

Użycie poleceń zawartych na stronie: https://minikube.sigs.k8s.io/docs/start/

`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`sudo install minikube-linux-amd64 /usr/local/bin/minikube`

![image](https://user-images.githubusercontent.com/72975469/172617449-c295ab61-4b91-4de7-b194-611100d99106.png)


`curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`

`sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
