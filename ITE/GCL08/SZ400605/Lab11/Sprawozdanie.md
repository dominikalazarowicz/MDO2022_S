# Szymon Piotr Zych 400605 Sprawozdanie_Lab011

# Instalacja klastra Kubernetes

## Zaopatrz się w implementację stosu k8s: minikube

![1.0](./1.0.png)

![1.1](./1.1.png)

## Zaopatrz się w polecenie kubectl

![1.2](./1.2.png)

## Uruchom Kubernetes, pokaż działający kontener/worker

![1.3](./1.3.png)

## Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność

![1.4](./1.4.png)

![1.5](./1.5.png)

# Analiza posiadanego kontenera

Aplikacja, którą wybrałem nie wyprowadzała andych portów dlatego zmieniłem projekt na potrzeby tego zadania.

Stowrzyłem dockerfile który robił obraz.

```
FROM node:14.16.1-buster

RUN apt-get update
RUN apt-get install -y --no-install-recommends git nano

RUN git clone https://github.com/BuiDuyThanh/node-chat-app
WORKDIR ./node-chat-app
RUN npm install
EXPOSE 3000
ENTRYPOINT npm run start
```

![2.0](./2.0.png)

Następnie powstały obraz wrzuciłem na dockerhuba

![2.1](./2.1.png)

![2.2](./2.2.png)

## Wykaż, że wybrana aplikacja pracuje jako kontener

![2.3](./2.3.png)

# Uruchamianie oprogramowania

## Uruchom kontener na stosie k8s

![3.0](./3.0.png)

## Przedstaw że pod działa (via Dashboard oraz kubectl)

![3.0.1](./3.0.1.png)

![3.1](./3.1.png)

![3.2](./3.2.png)

![3.3](./3.3.png)

## Wyprowadź port celem dotarcia do eksponowanej funkcjonalności

![3.4](./3.4.png)

## Przedstaw komunikację z eskponowaną funkcjonalnością

![3.5](./3.5.png)

![3.6](./3.6.png)

## Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-chat-deployment
  labels:
    app: devops-chat
spec:
  replicas: 4
  selector:
    matchLabels:
      app: devops-chat
  template:
    metadata:
      labels:
        app: devops-chat
    spec:
      containers:
        - name: devops-chat
          image: luxikhs/chat
          ports:
            - containerPort: 3000
```

![4.0](./4.0.png)

![4.1](./4.1.png)
