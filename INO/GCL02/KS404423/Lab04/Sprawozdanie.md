# Zajęcia 04
### 03.04.2022
---

## Zachowanie stanu

Na początku przygotowano dwa woluminy: wejściowy i wyjściowy:

```bash
$ docker volume create in
$ docker volume create out
```

![image-20220404231538096](Sprawozdanie.assets/image-20220404231538096.png)

Następnie utworzono nowy obraz do zbudowania projektu, bez narzędzi `git`, utworzono następujący plik `docker/build/Dockerfile`:

```dockerfile
FROM ubuntu:20.04
# Fix: Avoid asking some packages for geographic area
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y nodejs npm
WORKDIR /home
```

* `ENV DEBIAN_FRONTEND=noninteractive` - polecenie to wykorzystano aby uniknąć pytania o region w trakcie konfiguracji paczki `tzdata`

Wykorzystano komendę:

```bash
$ docker build -f ./docker/build/Dockerfile -t node-nogit .
```

![image-20220404232047630](Sprawozdanie.assets/image-20220404232047630.png)

![image-20220404232523855](Sprawozdanie.assets/image-20220404232523855.png)

Następnie wdrożono testowy kontener sprawdzający czy faktycznie udało się utworzyć obraz bez `git`:

```bash
$ docker run -it node-nogit bash
```

![image-20220404232613643](Sprawozdanie.assets/image-20220404232613643.png)

Jak widać udało się.

Aby sklonować repozytorium [simple-tetris](https://github.com/robertrypula/simple-tetris/) - program użytego na poprzednich zajęciach, najpierw należy znaleźć ścieżkę prowadzącą do woluminu wejściowego `in`:

```bash
$ docker volume inspect in
```

![image-20220404232915856](Sprawozdanie.assets/image-20220404232915856.png)

Jak widać miejsce zamontowania to `/var/lib/docker/volumes/in/_data`:

```bash
$ cd /var/lib/docker/volumes/in/_data
```

![image-20220404233041962](Sprawozdanie.assets/image-20220404233041962.png)

Próba przejścia do katalogu jako user kończy się niepowodzeniem, dlatego wykorzystano root:

```bash
$ sudo su
```

 ![image-20220404233146784](Sprawozdanie.assets/image-20220404233146784.png)

![image-20220404233153697](Sprawozdanie.assets/image-20220404233153697.png)

Następnie sklonowano repozytorium:

```bash
$ git clone https://github.com/robertrypula/simple-tetris.git
```

Dalej wdrożono kontener montując oba woluminy:

```bash
$ docker run -it -v in:/home/src -v out:/home/dist node-nogit
```

* Parametr `-v` jako pierwszy argument przyjmuje punkt montowania na maszynie hosta, a jako drugi punkt montowania w kontenerze
  * W tym przypadku wolumin wejściowy zamontowano w kontenerze w `/home/src` a wyjściowy w `/home/dist`

![image-20220404233516649](Sprawozdanie.assets/image-20220404233516649.png)

Zweryfikowano czy zamontowane ścieżki faktycznie znajdują się w kontenerze:

```bash
$ ls /home
$ ls /home/src
```

![image-20220404233748238](Sprawozdanie.assets/image-20220404233748238.png)

![image-20220404233818200](Sprawozdanie.assets/image-20220404233818200.png)

Dalej rozpoczęto build:

```bash
$ cd /home/src
$ npm install
$ npm run-script build
```

![image-20220404234006614](Sprawozdanie.assets/image-20220404234006614.png)

![image-20220404234152269](Sprawozdanie.assets/image-20220404234152269.png)

Powstałe pliki skopiowano do woluminu wyjściowego:

```bash
$ cp -r dist /home/dist/
```

Na komputerze hosta otworzono ścieżkę woluminu wyjściowego `/var/lib/docker/volumes/out/_data` jako root:

```bash
$ sudo su
$ cd /var/lib/docker/volumes/out/_data
```

![image-20220404235057443](Sprawozdanie.assets/image-20220404235057443.png)

Oraz uruchomiono grę:

```bash
$ node ascii-runner-node.js
```

![image-20220404235110011](Sprawozdanie.assets/image-20220404235110011.png)



---

## Eksponowanie portu

Na początku zalogowano się do Docker Hub z poziomu CLI:

```bash
$ docker login
```

![image-20220404235617955](Sprawozdanie.assets/image-20220404235617955.png)

Następnie zainicjowano wdrożenie kontenera serwera z narzędziem `ipref` (które zostanie pobrane z repozytorium do którego przed chwilą się zalogowano):

```bash
$ docker run -it networkstatic/iperf3 -p 8000:8000 -s
```

* Parametr `-p` odpowiada za eksponowanie portu, w tym przypadku portu 8000 oraz opublikowanie go do portu 8000 w komputerze hosta
* Parametr `-s` odpowiada za uruchomienie serwera `iperf3`

![image-20220405000019509](Sprawozdanie.assets/image-20220405000019509.png)

Następnie aby wdrożyć kontener klienta należy poznać adres IP serwera, co można osiągnąć następująco:

```bash
$ docker container list
$ docker inspect efcf18ffa857
```

![image-20220405000500726](Sprawozdanie.assets/image-20220405000500726.png)

Inspektor printuje mnóstwo informacji ale ta szukana znajduje się na końcu:

![image-20220405000540572](Sprawozdanie.assets/image-20220405000540572.png)

Dalej wdrożono kontener klienta:

```bash
$ docker run -it networkstatic/iperf3 -c 172.17.0.2 -p 8000:8000
```

* Parametr `-c` odpowiada za uruchomienie klienta oraz połączenie do wskazanego adresu IP



###  Połączenie kontener do kontenera

**Klient:**

![image-20220405000754237](Sprawozdanie.assets/image-20220405000754237.png)

**Serwer:**

![image-20220405000852200](Sprawozdanie.assets/image-20220405000852200.png)



## Połączenie host do kontenera

**Klient host:**

![image-20220405001838941](Sprawozdanie.assets/image-20220405001838941.png)

**Serwer kontener:**

![image-20220405001857573](Sprawozdanie.assets/image-20220405001857573.png)



## Połączenie poza hostem do kontenera w tej samej sieci LAN

**Klient poza hostem**

![image-20220405013645034](Sprawozdanie.assets/image-20220405013645034.png)

**Serwer kontener**

![image-20220405013745272](Sprawozdanie.assets/image-20220405013745272.png)



Jak widać wyniki przepustowości dla połączenia z innego kontenera oraz z hosta są dosyć podobne, na pewną korzyść hosta.

Z kolei łączenie się z innego komputera po sieci LAN dało najgorsze wyniki.



---

## Instalacja Jenkins

Zgodnie z [dokumentacją](https://www.jenkins.io/doc/book/installing/docker/), najpierw utworzono nową sieć dockerową:

```bash
$ docker network create jenkins
```

![image-20220405015135862](Sprawozdanie.assets/image-20220405015135862.png)

Następnie pobrano obraz `docker:dind` wykorzystując szereg argumentów:

* `--name` - nazwa kontenera
* `--detach` - wdraża kontener w tle
* `--privileged` - nadaje uprawnienia kontenerowi
* `--network` - precyzuje wcześniej utworzoną sieć
* `--network-alias` - pozwala na utworzenie aliasu sieci
* `--env` - podaje zmienne środowiskowe, w tym przypadku uruchamia TLS na serwerze
* `--volume` - montuje wolumin
* `--publish` - eksponuje porty do hosta
* `--storage-driver` - sterownik zapisu danych

```bash
$ docker run \
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

![image-20220405015850382](Sprawozdanie.assets/image-20220405015850382.png)

Następnie utworzono plik `docker/jenkins/Dockerfile` o następującej treści:

```dockerfile
FROM jenkins/jenkins:2.332.1-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
```

Dalej zbudowano obraz:

```bash
$ docker build -t myjenkins-blueocean:2.332.1-1 .
```

![image-20220405020154450](Sprawozdanie.assets/image-20220405020154450.png)

![image-20220405020643569](Sprawozdanie.assets/image-20220405020643569.png)

Na końcu wdrożono kontener, publikując go na portach 8080 oraz 50000:

```bash
$ docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:2.332.1-1
```

Uruchomiono przeglądarkę:

![image-20220405021014791](Sprawozdanie.assets/image-20220405021014791.png)

Wyszukano hasło:

```bash
$ docker exec -it jenkins-blueocean bash
$ cat /var/jenkins_home/secrets/initialAdminPassword 
```

![image-20220405021202047](Sprawozdanie.assets/image-20220405021202047.png)

Wybrano opcję instalacji sugerowanych wtyczek:

![image-20220405021245810](Sprawozdanie.assets/image-20220405021245810.png)

Na końcu otrzymano dashboard Jenkinsa:

![image-20220405021352042](Sprawozdanie.assets/image-20220405021352042.png)
