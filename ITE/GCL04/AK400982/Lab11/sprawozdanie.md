# Sprawozdanie z Lab11
### Instalacja minikube'a
![This is an image](ssy/minikube-instalacja.png)
![This is an image](ssy/minikube-install-2.png)

### Uruchomienie minikube w dashboardzie
![This is an image](ssy/minikube-dashboard.png)
![This is an image](ssy/minikube-dashboard-browser.png)

### Uruchomienie mongo bezpośrednio z obrazu
![This is an image](ssy/minikube-run.png)

### Screen z działającego poda
![This is an image](ssy/minikube-dashboard-run.png)

### Przekierowanie portów
![This is an image](ssy/port-forwarding.png)

### Podłaczenie do hostowanej bazy
![This is an image](ssy/compass-connection.png)

## Część druga

### Plik .yaml z configiem deploymentu
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-database
  labels:
    app: mongo-database
spec:
  replicas: 4
  selector:
    matchLabels:
      app: mongo-database
  template:
    metadata:
      labels:
        app: mongo-database
    spec:
      containers:
      - name: mongo-database
        image: mongo:latest
        ports:
        - containerPort: 27017
```
### Wersja z 4 replikami
![This is an image](ssy/replicas-4.png)

### Wersja z pojedynczym podem
![This is an image](ssy/replicas-1.png)

### Wersja z zerem replik
![This is an image](ssy/replicas-0.png)

### Uruchomienie ze zmienioną wersja obrazu na latest
![This is an image](ssy/replicas-4-latest.png)

### Rollout status z poprawnie wdrożonym deploymentem
![This is an image](ssy/rollout-status.png)

### Zmieniona wersja obrazu, na taką która wywoła crash
![This is an image](ssy/kubectl-crash.png)

### Odwołanie wykonanych czynności przez rollout undo
![This is an image](ssy/rollout-undo.png)
