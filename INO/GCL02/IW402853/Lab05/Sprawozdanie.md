## Sprawozdanie Lab05
### Przygotowujemy Pipeline!

- Docker in Docker (znany również jako dind) to, jak sama nazwa wskazuje, uruchamia Dockera w kontenerze Dockera. 
  Kontrolowanie kontenerów z kontenera Docker nie jest szczególnym przypadkiem użycia, ale często jest konieczne do uruchamiania narzędzi CI, takich jak 
  Jenkins.
- Pierwszym krokiem było uruchomienie Jenkinsa oraz Dinda zgodnie z dokumentacją.
- DIND
```shell
  docker run \
    --name jenkins-docker \
    --rm \
    --detach \
    --privileged \
    --network jenkins \
    --network-alias docker \
    --env DOCKER_TLS_CERTDIR=/certs \
    --volume jenkins-docker-certs:/certs/client \
    --volume jenkins-data:/var/jenkins_home \
    --publish 2376:2376 \
    docker:dind \
    --storage-driver overlay2
```
- Jenkins
```shell
  docker run \
    --name jenkins-blueocean \
    --restart=on-failure \
    --detach \
    --network jenkins \
    --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client \
    --env DOCKER_TLS_VERIFY=1 \
    --publish 8080:8080 \
    --publish 50000:50000 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    myjenkins-blueocean:2.332.3-1 
```
- Uruchomione kontenery
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/d35344c5e92fdec02453f21acf9db5190a16aa6f/INO/GCL02/IW402853/Lab05/docker%20dind%20jenkins.png)
- Następnym krokiem było przygotowanie dockerfile'ów potrzebnych do pobrania dependencji, builda, testów, deploy'a i publish'a.
- Dockerfile dependencies-irssi - załadowanie potrzebnych dependencji do poprawnego działania pipeline'u. 
```shell
  FROM fedora:34
  
  RUN yum install -y --skip-broken git gcc gcc-c++ make automake meson ca-c* libgcrypt* glib2* utf8proc* openssl-devel ncurses* libgcrypt* glib2-devel utf8proc* openssl-devel ncurses*
```
- Dockerfile builder-irssi - pobranie programu z repozytorium, zbudowanie oraz przesłanie go na wolumin wyjściowy.
```shell
  FROM dependencies-irssi:latest

  RUN git clone https://github.com/irssi/irssi.git
  WORKDIR irssi
  RUN meson setup build
  RUN ninja -C build
```
- Dockerfile tester-irssi - przeprowadzenie testów meson.
```shell
  FROM builder-irssi:latest
  
  WORKDIR build
  RUN meson test
```
- Dockerfile deploy-irssi - uruchomienie programu.
```shell
  FROM builder-irssi:latest
  
  RUN ninja -C build install
```
- Dockerfile publisher-irssi - spakowanie programu do tar'a z woluminu wyjściowego.
```shell
  FROM fedora:34
  
  WORKDIR output
```
- Nasze pliki dockerfile należało umieścić w kontenerze jenkins-blueocean w /var/jenkins_home
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/d35344c5e92fdec02453f21acf9db5190a16aa6f/INO/GCL02/IW402853/Lab05/dockerfile-w-var.png)
- Kolejnym krokiem było zalogowanie się na Jenkinsa z lokalnego hosta.
- Przygotowanie skryptu pipelinu i wstawienie go na strone.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ef81eab88c6c53778ac5703b4ec263125ae01527/INO/GCL02/IW402853/Lab05/skrypt.png)
- Uruchomienie builda i wybranie sugerowanej wersji 1.0.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ef81eab88c6c53778ac5703b4ec263125ae01527/INO/GCL02/IW402853/Lab05/wersja.png)
- Buildy - wystapiło parę błędów w związku ze źle wpisaną nazwą dockerfile'ów.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ef81eab88c6c53778ac5703b4ec263125ae01527/INO/GCL02/IW402853/Lab05/proces-build.png)
- Wydruk z konsoli ostatniego builda, który zakończył się sukcesem:

  ![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ef81eab88c6c53778ac5703b4ec263125ae01527/INO/GCL02/IW402853/Lab05/output-konsola.png)
- Utworzony pipeline w kontenerze w folderze workspace:
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ef81eab88c6c53778ac5703b4ec263125ae01527/INO/GCL02/IW402853/Lab05/zapis_pipelnie.png)
