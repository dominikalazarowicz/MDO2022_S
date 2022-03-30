SPRAWOZDANIE 2

1. Znalezienie repozytorium z kodem dowolnego oprogramowania, które spełnia wymagania wypunktowane w instrukcji:
https://github.com/deltachat/deltachat-desktop.git
-sklonowanie repozytorium:

2. Przeprowadzenie buildu w kontenerze:
-wykonanie build oraz test wewnątrz kontenera:
Stworzenie oraz uruchomienie kontenera komendą docker run -it --name JP --entrypoint /bin/sh node, następnie sklonowanie repozytorium przez HTTPS:



Zainstalowanie wymaganych zależności komendą npm install:

Wykonanie polecenia npm run build (zbudowanie programu):


Wykonanie polecenia npm test (uruchomienie testów):


-stowrzenie dwóch plików Dockerfile w celu automatyzacji powyższych kroków:
dockerfile_1:
FROM node
RUN apt-get update
RUN git clone https://github.com/deltachat/deltachat-desktop.git
WORKDIR deltachat-desktop
RUN npm install
RUN npm run build

dockerfile_2:
FROM zadanie_build:latest
WORKDIR deltachat-desktop
RUN npm test


Uruchomienie dockerfile_1 docker build . -f dockerfile_1 -t zadanie_build:


Uruchomienie dockerfile_2 dockerfile_2 docker build . -f dockerfile_1 -t zadanie_test

-wykazanie, że kontener wdraża się oraz pracuje poprawnie:

Wypisanie utworzonych obrazów sudo docker images:

Uruchomienie nowego obrazu poleceniem docker run -it --name zadanie_build zadanie_build:

WNIOSKI:
