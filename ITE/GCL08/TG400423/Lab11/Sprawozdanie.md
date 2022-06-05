| Imie   | Nazwisko | Data       |
|--------|----------|------------|
| Tomasz | Gąsior   | 31.05.2022 |

# Kubernetes

1. Instalacja minikube

![Alt text](./1.jpg)

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```

2. Pobranie kubectl

![Alt text](./2.jpg)

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

Pobranie pliku z sumą kontrolną.

![Alt text](./3.jpg)

```
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

Sprawdzenie instalacji z plikiem sumy kontrolnej.

![Alt text](./4.jpg)

```
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

Instalacja kubectl

![Alt text](./5.jpg)

Sprawdzenie instalacji

![Alt text](./6.jpg)

3. Dodanie użytkownik i docker do sudoers

![Alt text](./7.jpg)

4. Uruchomienie minicube

```
minikube start
```

5. Ustawienie minimalnej ilości rdzeni 

![Alt text](./8.jpg)


6. Uruchomienie minikube

![Alt text](./9.jpg)

7. Uruchomienie dashboard 

![Alt text](./10.jpg)

8. Uruchomienie nginx (projekt z pipeline nie udostępnia portów, użyto obrazu z dockerhub)

![Alt text](./11.jpg)

9. Działający pod

![Alt text](./12.jpg)

10. Port forwarding

![Alt text](./13.jpg)

11. Działająca aplikacja

![Alt text](./14.jpg)

12. Plik wdrożenia 

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80

```

13. Wynik pliku wdrożeniowego

![Alt text](./16.jpg)