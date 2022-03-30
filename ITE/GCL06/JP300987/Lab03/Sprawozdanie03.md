SPRAWOZDANIE 3

1. Znalezienie repozytorium z kodem dowolnego oprogramowania, które spełnia wymagania wypunktowane w instrukcji:
https://github.com/deltachat/deltachat-desktop.git

-sklonowanie repozytorium przez HTTPS:

![1](https://user-images.githubusercontent.com/92218468/160833500-a54c3cc0-4589-4887-9708-2fdcc07d15b7.JPG)

![2](https://user-images.githubusercontent.com/92218468/160833513-b24c8ed1-022c-45df-b1d4-934da803c914.JPG)



2. Przeprowadzenie buildu w kontenerze:
3. 
-wykonanie build oraz test wewnątrz kontenera:

Stworzenie oraz uruchomienie kontenera komendą docker run -it --name JP --entrypoint /bin/sh node, następnie sklonowanie repozytorium przez HTTPS:

![3](https://user-images.githubusercontent.com/92218468/160833560-f52e1f7c-a0de-48e7-b7a3-e98eb2f7cbbf.JPG)

Zainstalowanie wymaganych zależności komendą npm install:

![4](https://user-images.githubusercontent.com/92218468/160833616-4c291350-1005-4745-97ea-bbe0146af8c9.JPG)

Wykonanie polecenia npm run build (zbudowanie programu):

![5](https://user-images.githubusercontent.com/92218468/160833645-14f5152c-bd36-4a23-ba75-7d640b37e7e7.JPG)


Wykonanie polecenia npm test (uruchomienie testów):

![6](https://user-images.githubusercontent.com/92218468/160833681-45d5fdca-a1e0-427c-b532-d886433999e7.JPG)

-stowrzenie dwóch plików Dockerfile w celu automatyzacji powyższych kroków:


dockerfile_1:

![8](https://user-images.githubusercontent.com/92218468/160833861-87d65eab-e260-4227-bed3-0140927a4a6f.JPG)

FROM node

RUN apt-get update

RUN git clone https://github.com/deltachat/deltachat-desktop.git

WORKDIR deltachat-desktop

RUN npm install

RUN npm run build


dockerfile_2:

![10](https://user-images.githubusercontent.com/92218468/160833895-1f506084-8af5-45ec-8548-33e7bc754385.JPG)

FROM zadanie_build:latest

WORKDIR deltachat-desktop

RUN npm test


Uruchomienie dockerfile_1 docker build . -f dockerfile_1 -t zadanie_build:


![7](https://user-images.githubusercontent.com/92218468/160833786-737ffa70-d500-46e4-aa81-ff26ac1fcaa7.JPG)

Uruchomienie dockerfile_2 dockerfile_2 docker build . -f dockerfile_1 -t zadanie_test:


![9](https://user-images.githubusercontent.com/92218468/160833813-cfe838c5-c26b-443c-ae54-5b3229b2c061.JPG)

-wykazanie, że kontener wdraża się oraz pracuje poprawnie:


Wypisanie utworzonych obrazów sudo docker images:

![11](https://user-images.githubusercontent.com/92218468/160833934-c4b35379-3d59-43cb-b0d1-e69ba6ff9fe0.JPG)

Uruchomienie nowego obrazu poleceniem docker run -it --name zadanie_build zadanie_build:

![12](https://user-images.githubusercontent.com/92218468/160833959-ea57fced-eec5-43a5-914d-864252c6fa20.JPG)

WNIOSKI:

Zastosowanie plików Dockerfile pozwala na zautomatyzowane działania mające na celu np. utworzenie kontenera, w którym zostana zainicjowane wyselekcjonowane działania.
