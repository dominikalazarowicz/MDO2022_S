# Zajęcia 04
### 2022-03-28 
---
**1.** Utworzenie dwóch woluminów. Jeden wejściowy drugi wyjściowy. Tworzenie za pomocą komendy 
	`$ volume create`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/tworzenie_voluminow.PNG?raw=true)

 - Sprawdzenie połączenia woluminów komendą `$ sudo docker inspect`
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/inspect_vol.PNG?raw=true)
 - Uruchomienie kontenera oraz zamontowanie woluminów

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/uruchomienie_montowanie.PNG?raw=true)

 - Przejście do folderu woluminów oraz sklonowanie repozytorium komendą `$ git clone`

 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/przejscie_klonowanie.PNG?raw=true)

 - Sprawdzenie poprawności skopiowania. Przejście do kontenera oraz sprawdzenie czy repozytorium zostało sklonowane

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/sprawdzenieSkopiowania.PNG?raw=true)

 - Instalacja potrzebnych pakietów:
 `$ sudo dnf install meson`
 `$ sudo dnf install perl`
 `$ sudo dnf install gcc`
 `$ sudo dnf install glib2-devel`
 `$ sudo dnf install openssl-devel`
 `$ yum -y install utf8proc`
 `$ yum -y install libgcrypt`
 `$ yum -y install ncurses`
 
 **2.** Budowanie za pomocą komendy `$ meson Build`
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/mesonBUILD.PNG?raw=true)
 - Zapisanie powstałych plików na woluminie wyjściowym 

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/kopiowanie.PNG?raw=true)

**3.** Skorzystanie z obrazu docerowego `iperf3`. Wybranie portu 5201. Odpalenie kontenera w trybie serwera za pomocą komendy `$ docker run -it --rm -p 5201:5201 networkstatic/ipref3 -s`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/ustawienie5201.PNG?raw=true)

**4.** Uruchomienie nowego terminala, nasłuchiwanie portów komendą `$ netstat -utnpa | grep LISTEN`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/nas%C5%82uchiwanie.PNG?raw=true)

 - Sprawdzenie adresu IP serwera 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/sprawdzenieIP.PNG?raw=true)
 
 
 - Uruchomienie drugiego kontenera jako klient oraz połączenie się z wcześniej utworzonym serwerem
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/uruchomienie2Kontenera.PNG?raw=true)
 - Instalacja `ipref3`
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/instalacjaIPREF3.PNG?raw=true)
 - Połączenie się serwera z hostem 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/ipref3-c.PNG?raw=true)
 
 **5.** Przejście na system windows, pobranie `ipref3`. Uruchomienie programu korzystając z ip z komputera z ubuntu. Połączenie udało się, pokazują to logi z serwera
 
  ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/logi.PNG?raw=true)

**6.** Korzystając z dokumentacji jenkinsa ze strony https://www.jenkins.io/doc/book/installing/docker/ tworzę sieć dockerową za pomocą polecenia `$ sudo docker network create jenkins`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/networkcreate.PNG?raw=true)

 - Uruchomienie obrazu DIND kontenera 
 



Utworzenie Dockerfile, `$ touch Dockerfile` uzupełnienie go kodem zgodnie z dokumentacją

```
FROM jenkins/jenkins:2.332.2-jdk11
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

 - Uruchomienie `$ docker build -t myjenkins-blueocean:2.332.2-1 .`
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/uruchomienieBUILDA.PNG?raw=true)
 
 - Uruchomienie jenkinsa 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/sudoJENKINSrun.PNG?raw=true)

**7.** Sprawdzenie działania Jenkinsa

 - Wejście w adres 127.0.0.1:8080
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/JENKINSlogowanie.PNG?raw=true)

 - Sprawdzenie w `$  sudo docker ps` 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/sprawdzenieJENKINSa.PNG?raw=true)
 
 

 - Skopiowanie hasła 
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/haslo.PNG?raw=true)

 - Ostateczne działanie Jenkinsa oraz zalogowanie się

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab04/DzialanieJenkinsaOST.PNG?raw=true)
