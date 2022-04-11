# Sprawozdanie - lab_04
## Gerard Skomin
### 1. Zachowanie stanu
* Przygotowanie voluminów wejściowego i wyjściowego, podłączenie ich do kontenera bazowego  
  * Voluminy o nazwach `in_volume` i `out_volume` przy użyciu komendy `sudo docker volume create`  
  ![](volume.png)  
* Przygotowanie i uruchomienie kontenera  
  * Zamontowanie voluminów i uruchomienie kontenera przy użyciu komendy o strukturze: `sudo docker run -it --name... --mount source=..., target=...`  
  ![](montowanie.png)  
  * Wyświetlenie informacji o voluminach: `sudo docker inspect`  
  ![](inspect.png)  
  * Zainstalowanie niezbędnych dependencji
  ![](dependencje1.png)  
  ![](dependencje2.png)  
* Klonowanie repozytorium na wolumin wejściowy  
  * Uruchomienie poziomu *root'a*: `sudo -s`  
  * Sklonowanie repozytorium do danych na voluminie wejściowym: `git clone ...`  
  ![](clone.png)  
  * Zawartość volumenu  
  ![](prebuild.png)  
* Uruchomienie build'a programu w kontenerze  
  * Zbudowanie programu: `make`  
  ![](make.png)  
* Zapisanie zbudowanego programu na woluminie wyjściowym  
  * Przeniesienie gotowego programu na wolumin wyjściowy: `cp -r 2048 /out/`  
  ![](cp.png)  
  * Wykazanie działania programu  
  ![](works.png)  
  * Po wyjściu z kontenera wykazanie dostępności programu na odpowiedniej ścieżce  
  ![](works2.png)  

### 2. Eksponowanie portu  
* Uruchomienie serwera iperf w kontenerze  
  * Pobranie nadającego się obrazu dockerowego: `docker pull clearlinux/iperf`  
  ![](clearlinux.png)  
  * Uruchomienie serwera: `sudo docker run -it --rm --name=iperf -p 5201:5201 clearlinux/iperf -s`  
  ![](iperf.png)  
* Połączenie się z innego kontenera i badanie przepustowości  
  * Sprawdzenie ip
  ![](network.png)  
  * Sprawdzenie nasłuchiwania poleceniem `netstat -utnpa | grep LISTEN`  
  ![](listen.png)  
  * Nawiązanie połączenia z innym kontenerem uruchomionym analogicznie do poprzedniego  
  ![](gb.png)  
* Połączenie się spoza kontenera  
  * Instalacja **iperf** na hoście  
  ![](iperfinstall.png)  
  * Nawiązanie połączenia z hosta komendą `iperf3 -c 172.17.0.2 -t 30 -p 5201`  
  ![](gb2.png)  
  * Instalacja iperf na **windows'ie**  
  ![](iperfinstallwindows.png)  
  * Próba połączenia i błąd  
  ![](windowsfailed.png)  
* Analiza przepustowości  
  * Największa przepustowość połączenia wystąpila w komunikacji między hostem a kontenerem, jednakże różnice są niewielkie.  

### 3. Instalacja Jenkins'a  
* Zapoznanie się z dokumentacją  
  * Wejście na oficjalną stronę Jenkinsa, zapoznanie się z dokumentacją i przebiegiem instalacji  
  ![](doc.png)  
* Instalacja Jenkins'a z pomocnikiem DIND  
  * Utworzenie "**bridge network**": `docker network create jenkins`  
  ![](jenkins1.png)
  * Pobranie i uruchomienie przy pomocy komend z dokumentacji  
  ![](jenkins2.png)  
  * Utworzenie i edycja Dockefile'a: `code Dockerfile`  
  ![](jenkins3.png)  
  ![](jenkins4.png)  
* Inicjalizacja instalacji  
  * Zbudowanie obrazu jenkinsa inicjalizującego instalację przy pomocy komend z dokumentacji  
  ![](jenkins5.png)  
  * Uruchomienie nowego obrazu jenkinsa  
  ![](jenkins6.png)
* Wykazanie działania kontenerów  
  * Wyświetlenie działających obrazów dockerowych: `sudo docker images`  
  ![](jenkins6.png)  
  * Wyświetlenie działających kontenerów dockerowych: `sudo docker ps`  
  ![](jenkins12.png)  
* Konfiguracja nowego środowiska  
  * Uruchomienie Jenkinsa przy pomocy localhost'a `http://localhost:8080`  
  ![](jenkins8.png)  
  * Odczytanie hasła wejściowego z odpowiedniej ścieżki udostępnionej w dokumentacji  
  ![](jenkins9.png)  
  * Pierwsze logowanie i istalacja wtyczek
* Działający Jenkins  
  * Ekran logowania Jenkinsa  
  ![](jenkins10.png)  
  * Hub Jenkinsowy po zalogowaniu  
  ![](jenkins11.png)  