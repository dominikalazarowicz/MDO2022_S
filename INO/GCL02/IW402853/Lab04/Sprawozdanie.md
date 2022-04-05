# Sprawozdanie Lab04


## Zachowywanie stanu 
- Utworzenie voluminu wejściowego i wyjściowego używając ```sudo docker volume create --name vol_in/vol_out```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/0cef4ef8de182203e9d13dd6b5dfa2ee4360dffb/INO/GCL02/IW402853/Lab04/utworzenie%20voluminow.png)
- Sprawdzenie połączenia voluminów oraz ścieżki przy pomocy ```sudo docker inspect vol_in/vol_out```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/0cef4ef8de182203e9d13dd6b5dfa2ee4360dffb/INO/GCL02/IW402853/Lab04/sprawdzenie%20polaczenia%20voluminow.png)
- Uruchomienie kontenera razem z podłączeniem do niego voluminów ```sudo docker run -it --name node_volume --mount source=vol_in,target=/vol_in --mount source=vol_out,target=/vol_out node bash```.
Jak widać nasze foldery z voluminami zostały dodane do kontenera.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/e1a59d7838179889b313cca8d76cbaa0f24ca60a/INO/GCL02/IW402853/Lab04/uruchomienie%20kontenera.png)
- Skopiowanie repozytorium na volumin wejściowy ```vol_in``` ```git clone [...]``` używając ścieżki do naszych voluminów wyświetloną wcześniej.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/553a99a5c1b361030a95ea0b5c87a5f5cf34c6d6/INO/GCL02/IW402853/Lab04/skopiowanie%20repozytorium%20na%20volumin%20wej%C5%9Bciowy.png)
- Wejście do kontenera. Repozytorium znajduje się w kontenerze. Pobranie potrzebnych zależności przy użyciu ```npm install```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/73d317c07ea0bb1d3dee7e304e08d9d1ecfb04a2/INO/GCL02/IW402853/Lab04/pobranie%20potrzebnych%20zale%C5%BCno%C5%9Bci.png)
- Uruchomienie builda za pomocą ```npm run build```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/73d317c07ea0bb1d3dee7e304e08d9d1ecfb04a2/INO/GCL02/IW402853/Lab04/budowa%20projektu.png)
- Skopiowanie powstałych plików na volumin wyjściowy ```vol_out``` przy użyciu ```cp -r build /vol_out```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/8e53aad709127c562ebe6dd40605a4093401c1f2/INO/GCL02/IW402853/Lab04/skopiowanie%20build%20na%20vol_out.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/8e53aad709127c562ebe6dd40605a4093401c1f2/INO/GCL02/IW402853/Lab04/pliki%20z%20voluminu%20wyjsciowego.png)


## Eksponowanie portu
- Pobranie odpowiedniego obrazu dockerowego ```docker pull networkstatic/iperf3```. Uruchomienie wewnątrz kontenera serwera iperf3 ```docker run```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ce431b9ae9f064cd6c09e1646348ac3b5fd1d9ca/INO/GCL02/IW402853/Lab04/pobranie%20obrazu%20iperf3%20uruchomienie.png)
- Widoczny pobrany obraz ```sudo docker images```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ce431b9ae9f064cd6c09e1646348ac3b5fd1d9ca/INO/GCL02/IW402853/Lab04/widoczny%20obraz%20docker%20networkstatics.png)
- Sprawdzenie czy serwer nasłuchuje ```sudo netstat -utnpa | grep LISTEN```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/ce431b9ae9f064cd6c09e1646348ac3b5fd1d9ca/INO/GCL02/IW402853/Lab04/sprawdzenie%20czy%20nasluchuje.png)
- Sprawdzenie IP naszego serwera ```sudo docker inspect --format "{{ .NetworkSettings.IPAddress }}" iperf3-server```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/f31ff8553f58c27028d39d09b10b9b1230a5290d/INO/GCL02/IW402853/Lab04/uzyskanie%20adresu%20ip%20utworzonego%20serwera.png)
- Połączenie się z serwerem z drugiego kontenera. ```sudo docker run -it --rm networkstatic/iperf3 -c 172.17.0.2```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/a2ec2bee9e7c0e6237c53f3fd42d4b13909eafdb/INO/GCL02/IW402853/Lab04/uruchomienie%20kontenera%20wskazuja%20na%20ip%20serwera.png)
- Instalacja iperf3 na hoście ```sudo apt-get install iperf3```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/a2ec2bee9e7c0e6237c53f3fd42d4b13909eafdb/INO/GCL02/IW402853/Lab04/instalacja%20iperf3.png)
- Połączenie się z serwerem spoza kontenera z hosta ```sudo iperf3 -c 172.17.0.2```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/a2ec2bee9e7c0e6237c53f3fd42d4b13909eafdb/INO/GCL02/IW402853/Lab04/laczenie%20sie%20z%20serwerem%20z%20hosta.png)
- Połączenie się spoza kontenera i hosta.(nieudane)

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/6c05f4a597773e2ad725b6dabda830ee9b0fa65d/INO/GCL02/IW402853/Lab04/polaczenie%20spoza%20hosta.png)
- Przepustowość komunikacji. Wyciągnięcie logów z kontenera.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/a2ec2bee9e7c0e6237c53f3fd42d4b13909eafdb/INO/GCL02/IW402853/Lab04/logi%20z%20serwera.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/a2ec2bee9e7c0e6237c53f3fd42d4b13909eafdb/INO/GCL02/IW402853/Lab04/logi%20z%20serwera%20v2.png)
Największa przepustowość występowała w połączeniu pomiędzy dwoma kontenerami, transfer danych pomiędzy kontenerem a hostem był niewiele mniejszy.


## Instancja Jenkins
- Instalacja Jenkins [https://www.jenkins.io/doc/book/installing/docker/](https://www.jenkins.io/doc/book/installing/docker/)
- Utworzenie nowej sieci dockerowej ```sudo docker network create jenkins```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/utworzenie%20nowej%20sieci%20dockerowej.png)
- Pobranie i uruchomienie obrazu dind kontenera.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/pobranie%20i%20uruchomienie%20docker%20dind.png)
- Stworzenie pliku dockerfile. ```touch```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/utworzenie%20pliku%20dockerfile.png)
- Dziedziczenie z obrazu jenkins/jenkins: 2.332.1-jdk11 przez kontener.
```
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
- Uruchomienie builda ```sudo docker build -t myjenkins-blueocean:2.332.1-1 .```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/uruchomienie%20builda%20.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/uruchomienie%20builda%20v2.png)
- Uruchomienie stworzonego obrazu.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/utworzony%20obraz%20jenkinsa.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/uruchomienie%20obrazu.png)
- Uruchomiona instancja Jenkinsa, lokalny host. 
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/instancja%20jenkinsa%20localhost.png)
- Odczytanie hasła za pomocą ```sudo docker exec```,```cat```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/haslo%20do%20jenkinsa.png)
- Zalogowanie się i instalacja zalecanych wtyczek.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/instalacja%20zalecanych%20wtyczek.png)
- Wykazanie, że kontenery działają za pomocą komendy ```sudo docker ps```.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/sudo%20docker%20ps.png)
- Pokazanie ekranu logowania do Jenkinsa.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/695eef59de71fca4e28f0ecc1bdb8283327f7f3a/INO/GCL02/IW402853/Lab04/ekran%20logowania%20jenkins.png)
