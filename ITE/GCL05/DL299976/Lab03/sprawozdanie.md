# Lab 03 - Dominika Lazarowicz
## 1 - skonowanie wybranego repozytorium
Link - https://github.com/joshuarwynn/simple-node-app

![alt text](1.png)

## 2 - Zbudowanie aplikacji włączenie testów
![alt text](2.png)

## 3 - Stworzenie plików dockerfile

```
FROM node
RUN apt-get update -y
Run git clone https://github.com/joshuarwynn/simple-node-app.git
WORKDIR simple-node-app

RUN npm install -g npm@8.6.0
RUN npm install express
RUN npm run build
```

```
FROM dockerfile-build:lastes
WORKDIR simple-node-app
RUN npm test
```

## 4 - Uruchomienie aplikacji w kontenerze
![alt text](3.png)

