## Zadania do wykonania
### Zachowywanie stanu
* Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do kontenera bazowego, z którego rozpoczynano poprzednio pracę

	Zostały stworzone woluminy wejściowy i wyjściowy za pomocą komend ```sudo docker volume create inputVolumeL4``` i ```sudo docker volume create outputVolumeL4```.

![](ScreenShots/createVolumes.png?raw=true)

---

* Uruchom kontener, zainstaluj niezbędne wymagania wstępne (jeżeli istnieją), ale *bez gita*

	Kontener został uruchomiony komendą ```sudo docker run -it --name lab04ex1 --mount source=inputVolumeL4,destination=/inputV
 --mount source=outputVolumeL4,destination=/outputV ubuntu```(z zamontowaniem wejściowego i wyjściowego woluminu). Następnie zostały doinstalowane zależności poleceniami 
	```
	apt-get -y update
	apt-get -y install maven
	apt-get -y install openjdk-11-jdk
	```

![](ScreenShots/createContainer.png?raw=true)

![](ScreenShots/JDKInstall.png?raw=true)

---

* Sklonuj repozytorium na wolumin wejściowy

	Repozytorium zostało sklonowane na wolumin wejściowy do katalogu repo z zewtnątrz (kontenera) używając polecenia ```sudo git clone https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven.git ./var/lib/docker/volumes/inputVolumeL4/_data/repo/```. Było to możlwie dzięki prawom administratora, w wypadku nie posiadania ich należałoby użyć innego kontenera do tego zadania.

![](ScreenShots/cloneRepoToVolumeFromOutside.png?raw=true)

---

* Uruchom build w kontenerze

	Uruchomiono build w kontenerze za pomocą ```mvn install``` (jest to build z odpaleniem testów).

![](ScreenShots/buildAppStart.png?raw=true)

![](ScreenShots/buildAppSuccess.png?raw=true)

---

* Zapisz powstałe/zbudowane pliki na woluminie wyjściowym

	Skopiowano powstały folder "target"(z całą jego zawartością) do woluminu wyjściowego (podpiętego jako "outputV") za pomocą komendy ```cp -R target ../../outputV/``` .

![](ScreenShots/cpToOutput.png?raw=true)

---


### Eksponowanie portu
* Uruchom wewnątrz kontenera serwer iperf (iperf3)

	Uruchomiono serwer iperf na kontenerze stworzonym komendą ```sudo docker run -it --name lab04ex02t02 --publish 5201:5201 ubuntu```. W tym celu użyto następujących poleceń:
	```
	apt-get update
	apt install iperf3
	iperf3 -s
	```
	
![](ScreenShots/iperf3ServOnContainer.png?raw=true)

---

* Połącz się z nim z drugiego kontenera, zbadaj ruch

	Stworzono drugi kontener ```sudo docker run -it --name lab04ex02t03 --publish 5211:5201 ubuntu```. Po czym użyto następujących komend:
	```
	apt-get update
	apt install iperf3
	```
	
	Następnie sprawdzono ip kontenera, na którym znajduje się serwer komendą ``` sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lab04ex02t02```.
	
	Na końcu połączono się z drugiego kontenera do pierwszego komendą ```iperf3 -c 172.17.0.2 -t 30 -p 5201```. Przesłano 52.8 Gb ze średnią prędkością przesyłu 15.1 Gb/s. Można również zauważyć, że większe pliki (pojednńczych plików było 30) były przesyłane z większą prędkością.

![](ScreenShots/howGotIPOfContainerServ.png?raw=true)

![](ScreenShots/iperfConnection.png?raw=true)

---

* Połącz się spoza kontenera (z hosta i spoza hosta)

	Połączono się również z hosta i spoza hosta komendą ```iperf3 -c 127.0.0.1 -t 30 -p 5201```. Teraz przesłano 37.7 Gb, ze średnią prędkością 10.8 Gb/s. Prędkość jest niższa, lecz średnia wielkość przesyłanego pliku również, co ma wpływ na wynik.
	
	Następnie połączono się z spoza hosta (Windows) pobierając plik wykonywalny perf3.exe i używając komendy ```./iperf3.exe -c 127.0.0.1 -t 30 -p 5211```. W tym przypadku prędkość była najmniejsza, lecz również średnia wielkość przesyłanego pliku.

![](ScreenShots/connectionFromHost.png?raw=true)

![](ScreenShots/connectionFromOutsideHost.png.png?raw=true)

![](ScreenShots/portForwardingVM.png.png?raw=true)

---

* Przedstaw przepustowość komunikacji lub problem z jej zmierzeniem (wyciągnij log z kontenera)

| Skąd | Przepustowość | Wielkość przesłanych danych |
|---|---|---|
| Kontener | 15.1 Gbits/sec | 52.8 GBytes |
| Host | 10.8 Gbits/sec | 37.7 GBytes |
| Windows (poza hostem)| 832 Mbits/sec | 2.91 GBytes |

![](ScreenShots/createVolumes.png?raw=true)

---


### Instancja Jenkins
* Zapoznaj się z dokumentacją  https://www.jenkins.io/doc/book/installing/docker/
* Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND

	Zgodnie z dokumentacją użyto komend następujących do stworzenia sieci i kontenera z jenkinsem
	```
	docker network create jenkins
	
	docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
	```
	
	Następnie przy pomocy następującego docker file:
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
	
	komendą ```docker build -t myjenkins-blueocean:2.332.2-1 . -f ./DockerfileJenkins```
	
	

![](ScreenShots/jenkinsInstalationPart1.png?raw=true)

![](ScreenShots/jenkinsInstalationPart2.png?raw=true)

---

* Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania

	Zainicjowano instancję komendą 
	```
	docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.332.2-1
  ```
	A następnmie sprawdzono działające kontenery ```docker ps```
	
	Później dodano przekerowywanie portu z zewnętrznego (Windowsa) 8282 na 8080 w linuxsie w celu możliwości uruchamiania jenkinsUI na zewnątrz.

![](ScreenShots/initialisingDocker.png?raw=true)

![](ScreenShots/addedPortForwarding.png?raw=true)

![](ScreenShots/loginToJenkins.png?raw=true)

