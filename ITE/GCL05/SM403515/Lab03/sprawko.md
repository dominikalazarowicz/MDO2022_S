# Sprawozdanie - LAB 03

## Zadania do wykonania

### Wybór oprogramowania na zajęcia

- Znajdź repozytorium z kodem dowolnego oprogramowania, które:
- Sklonuj niniejsze repozytorium, przeprowadź build programu (doinstaluj wymagane zależności)

```
git clone https://github.com/hashicorp/terraform-provider-azurerm.git
```

![This is an image](images/clonerepo.png)

```
make build
```

![This is an image](images/buildlocal.png)

- Uruchom testy jednostkowe dołączone do repozytorium

Output z testów znajduje się w pliku ze względu na objętość

```
make test
```

![This is an image](images/teststart.png)

![This is an image](images/testpass.png)

### Przeprowadzenie buildu w kontenerze

1. Wykonaj kroki build i test wewnątrz wybranego kontenera bazowego

   - uruchom kontener
   - podłącz do niego TTY celem rozpoczęcia interaktywnej pracy

```
docker run -it --name devops-golang-azure golang:1.16-alpine sh
```

![This is an image](images/gocontainer.png)

- zaopatrz kontener w wymagania wstępne (jeżeli proces budowania nie robi tego sam)
- sklonuj repozytorium

```
apk add git gcc libc-dev bash make
git clone https://github.com/hashicorp/terraform-provider-azurerm.git
```

![This is an image](images/installgit.png)
![This is an image](images/containeraddmake.png)
![This is an image](images/containerclone.png)

- uruchom build

```
make build
```

![This is an image](images/containerbuild.png)

- uruchom testy

```
make test
```

![This is an image](images/containertest.png)

2. Stwórz dwa pliki Dockerfile automatyzujące kroki powyżej, z uwzględnieniem następujących kwestii
   - Kontener pierwszy ma przeprowadzać wszystkie kroki aż do builda

```
FROM golang:1.16-alpine

RUN apk add git gcc libc-dev bash make

RUN git clone https://github.com/hashicorp/terraform-provider-azurerm.git

RUN cd terraform-provider-azurerm && make build
```

![This is an image](images/dockerbuild.png)

- Kontener drugi ma bazować na pierwszym i wykonywać testy

```
FROM devops-golang-terraform:build

RUN cd terraform-provider-azurerm && make test
```

![This is an image](images/dockertest.png)
![This is an image](images/dockertestpass.png)

3. Wykaż, że kontener wdraża się i pracuje poprawnie. Pamiętaj o różnicy między obrazem a kontenerem. Co pracuje w takim kontenerze?

Obraz to konfigurowalna "baza" na podstawie, której tworzony jest kontener. Kontener korzysta z obrazów najczęściej umieszczanych w rejestrach i jest wykonywalny - w przeciwieństwie do obrazu

```
docker images
```

![This is an image](images/dockerimages.png)

```
docker run -it --rm --name devops-golang-azure-test-pass-run devops-golang-terraform:test
```

![This is an image](images/dockerruntested.png)

### Zakres rozszerzony tematu sprawozdania

#### Docker Compose

- Zamiast ręcznie wdrażać kontenery, ujmij je w kompozycję

```
version: '3'

services:
    app:
        build:
            dockerfile: Dockerfile.build
        container_name: compose-devops-app
    test:
        depends_on:
            - compose-devops-app
        restart: always
        build:
          dockerfile: Dockerfile.test
        container_name: compose-devops-test
```

![This is an image](images/compose.png)

#### Przygotowanie do wdrożenia (deploy): dyskusje

Otrzymany kontener ze zbudowanym programem może, ale nie musi, być już końcowym artefaktem procesu przygotowania nowego wydania. Jednakże, istnieje szereg okoliczności, w których nie ma to sensu. Na przykład gdy chodzi o oprogramowanie interaktywne, które kiepsko działa w kontenerze.

Przeprowadź dyskusję i wykaż:

- czy program nadaje się do wdrażania i publikowania jako kontener, czy taki sposób interakcji nadaje się tylko do builda

Kontener sam w sobie raczej nie może być deployowany (przykładowo) na kubernetesowy cluster lub serwer. Przynajmniej ja osobiście nie słyszałem o takim działaniu

Bardziej popularną (jak nie jedyną rozsądną) drogą wdrażania aplikacji dockerowej jest umieszczenie zbudowanego obrazu w tzw. Registry, po czym nastąpić może pull takiego image'u i uruchomienie kontenera np. w chmurze z wykorzystaniem takiego obrazu.

Przykład: projekt jest budowany z wykorzystaniem GitLabowego CI, po czym automatycznie zbudowany obraz udostepniany w prywatnym registry. Po tym następuje podmiana obrazu, na którym pracuje serwer

- opisz w jaki sposób miałoby zachodzić przygotowanie finalnego artefaktu

  - jeżeli program miałby być publikowany jako kontener - czy trzeba go oczyszczać z pozostałości po buildzie?

  - A może dedykowany _deploy-and-publish_ byłby oddzielną ścieżką (inne Dockerfiles)?
  - Czy zbudowany program należałoby dystrybuować jako pakiet, np. JAR, DEB, RPM, EGG?
  - W jaki sposób zapewnić taki format? Dodatkowy krok (trzeci kontener)? Jakiś przykład?
