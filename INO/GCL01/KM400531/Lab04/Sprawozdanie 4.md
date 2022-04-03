# Krzysztof Maurek #
## Inżynieria Obliczeniowa, gr. 1 ##
### Sprawozdanie 4 ###
Na początku utworzyłem dwa woluminy - wejściowy i wyjściowy. Przełącznik --name pozwalił na nadanie nazw tym woluminom  
![](docker_volume.png)  
Aby sprawdzić informację o woluminie używam polecenia docker volume inspect. Mogę w ten sposób sprawdzić m.in punkty montowania  
![](docker_inspect.png)  
Następnie uruchamiam kontener oraz montuje oba woluminy. Dzięki przełącznikowi -it uruchamiam w nim terminal,a zięki przełącznikowi -v motuje woluminy(w formacie nazwa_woluminu:/miejsce_do_zamontowania)  
![](volume_run.png)  
Aby skopiować bezpośrednio repozytorium przechodzę do miejsca montowania woluminu, który pokazałe w jednym z poprzenich kroków. Następnie kopiuje repozytorium  
![](clone_wejsciowy.png)  
W celu sprawdzenia poprawnego sklonowania wchodzę w kontener i sprawdzam czy znajduje się tam skopiowane repozytorium  
![](docker_wejscie.png)  
W celu zbudowania programu wchodzę na kontener i instaluje wszystkie potrzebne pakiety do zbudowania  
![](pakiety.png)  
Następne buduje program  
![](build.png)  
W kolejnym kroku zapisuje powstałe pliki na woluminie wyjściowym  
![](kopiowanie.png)  
Sprawdzam w woluminie wyjściowym z poziomu hosta czy katalog Build został przeniesiony  
![](wyjscie_kopia.png)  
Znajduje na internecie odpowiedni obraz dockerowy z iperf3. Za pomocą przełącznika --rm obraz zostanie usunięty po zamknięciu, -p do publikowania wybranego portu (tutaj 5201), przełącznik -s odpala kontener w trybie serwera  
![](iperf3.png)  
W kolejnym kroku odpalam drugi terminal w nowym oknie i sprawdzam nasłuchujące porty. Jak widać port jest przedostatni na tej liście  
![](podsluchiwanie.png)  
Sprawdzam adres IP serwera  
![](IP.png)  
Uruchamiam drugi kontener w trybie klienta (przełącznik -c) i łącze się z serwerem  
![](klient.png)  
Instaluje pakiet iperf3 na hoście oraz łącze się z serwerem z hosta  
![](iperf_host.png)  
Uruchamiam drugi kontener w trybie klienta (przełącznik -c) i łącze się z serwerem  
![](klient.png)  
Instaluje pakiet iperf3 na hoście oraz łącze się z serwerem z hosta  
![](iperf_host.png)  
Z racji że stosuje natywnego linuxa do połączenia się spoza hosta używam innego komputera z windowsem. Na początku za pomocą komendy ifconfig sprawdzam IP komputera z linuxem. Następnie pobieram program iperf3 na windowsa i uruchamiam go podając mój adres IP  
![](spoza_hosta.png)  
Sprawdzam logi z serwera  
![](logi1.png)  
![](logi2.png)  
Zapoznaje się z dokumentacją Jenkinsa. Następnie tworzę nową sieć dockerową za pomocą polecenia docker network create. Argument jenkins określa nazwę sieci używanej w kontenerach  
![](jenkins.png)  
Następnie uruchamiam obraz DIND kontenera zgodnie z dokumentacją  
![](jenkins_run.png)  
Tworzę Dockerfile zgondnie z dokumentacją  
![](dockerfile.png)  
W kolejnym kroku uruchamiam build  
![](build_jenkins.png)  
Uruchamiam jenkinsa  
![](jenkins_run3.png)  
Jak widać Jenkins działa  
![](unlock.png)  
![](jenkinsfree.png)  
Sprawdzam haslo administratorskie aby móc się zalogować  
![](hasło.png)  
Następnie instaluje wszystkie pakiety i konfiguruje konto w Jenkinsie  
![](logowanie.png)  
