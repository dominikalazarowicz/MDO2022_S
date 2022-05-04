# Sprawozdanie Lab_03 Kacper Nosarzewski

## 1. Cel cwiczenia

Celem laboratorium byo znalezienie repozytorium z licencja open source i przeprowadzenie buildu w kontenerze 

## 2. Wykonanie cwiczenia
1. Wybranie repozytorium typu open source https://github.com/mongo-express/mongo-express
2. Sklonowanie repozytorium za pomoca klucza ssh poleceniem `git clone git@github.com:mongo-express/mongo-express.git`
![img](git_clone.PNG)
3. Zainstalowanie odpowiednich zaleznosc poleceniem `npm install`
![img](npm_install.PNG)
4. Budowanie programu poleceniem `npm run build`
![img](npm_run_build.PNG)
5. Uruchomienie testow poleceniem `npm test`
![img](npm_test.PNG)
6. Obraz ubuntu byl juz pobrany na urzadzenie co wykazuje polecenie `sudo docker images`
![img](sudo_docker_pull_ubuntu.PNG)
7. Utworzenie i uruchomienie kontenera poleceniem `sudo docker --name KN_node -it ubuntu`
![img](KN_node.PNG)
8. Sklonowanie repozytorium po HTTPS do stworzonego kontenera poleceniem `git clone https://github.com/mongo-express/mongo-express.git`
![img](bash_git_clone.PNG)
9. Pobranie odpwiednich zaleznosci w kontenerze poleceniem `npm install` po wczesniejszej instalacji pakietu npm poleceniem `apt-get install npm`
 ![img](bash_npm_install.PNG)
10. Zbudowanie programu w kontenerze poleceniem `npm run build`
 ![img](npm_run_build_bash.PNG)
11. Uruchimienie testow w stworzonym kontenerze poleceniem `npm test`
![img](npm_test_bash.PNG)
12. Stworzenie pliku Dockerfile1 ktory zawiera polecenia od sklonowania repozytorium do zbudowania programu
![img](cat_Dockerfile1.PNG)
```
FROM node:latest

RUN git clone https://github.com/mongo-express/mongo-express.git

WORKDIR mongo-express

RUN npm install

RUN npm run build

```
12. Stworzenie pliku Dockerfile2 zawierajacego polecenia do testow
![img](cat_Dockerfile2.PNG)

```
FROM kacper_build:latest

WORKDIR mongo-express

RUN npm test

```
13. Uruchomienie pliku do zbudowania programu poleceniem `sudo docker build . -f Dockerfile1 -t kacper_build `
![img](dockerfile1.PNG)
![img](Dockerfile11.PNG)
14. ruchomienie pliku do testow poleceniem `sudo docker build . -f Dockerfile2 -t kacper_test`
![img](docker_test.PNG)
15. Wyswietlenie powstalych obrazow komenda `sudo docker images`
![img](images.PNG)
16. Uruchomienie nowego obrazu poleceniem ` sudo docker run -it --name kacper_build kacper_build`
![img](docker_run.PNG)