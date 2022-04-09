# Laboratorium 04

## Zachowywanie stanu

### tworzymy wolumeny za pomocą komendy` docker volume create`
![](./01-create-volume.PNG)

### sprawdzamy poprawność utworzenia komendą `docker volume inspect`
![](./02-volumes-details.PNG)

### uruchamiamy kontener i dołączamy do niego volumeny za pomocą flagi `-v <name>:<mounting-point>`
![](./03-run-and-mount.PNG)

### klonujemy repozytorium z poziomu systemu Windows
odnalezienie lokalizacji volumenów wybranej przez Docker Desktop okazało się nie do końca trywialne, po tej przygodzie podjęto decyzję o instalacji dockera wewnątrz Ubuntu
![](./04-git-clone.PNG)

### uruchamiamy build w kontenerze
![](./05-copy-to-docker.PNG)
![](./06-yarn.PNG)
![](./07-build.PNG)

### kopiujemy output na volumen wyjściowy
![](./08-copy-to-output.PNG)
wynik builda jest dostępny z poziomu hosta
![](./09-check-copy.PNG)

## Eksponowanie portu

### uruchamiamy kontener z udostępnionym portem `-p <host-port>:<container-port>`
instalujemy `net-tools` w celu zbadania adresu IP oraz `iperf3` w celu zbadania przepustowości połączenia
uruchamiamy serwer iperf3 na porcie `1234` 
![](./10-fedora-iperf.PNG)

### badamy przepustowość z drugiego kontenera
wykonujemy podłączenie klientem `iperf -c` z kontenera znajdującego się w tej samej sieci co serwer
![](./11-docker-docker.PNG)

### badamy przepustowość z hosta
wykonujemy test z poziomu WSLa
![](./12-wsl-docker.PNG)

### badamy przepustowość z poza hosta 
wykonujemy test z poziomu Windowsa
![](./13-windows-dockerPNG.PNG)

### zestawienie przepustowości

| docker-docker| docker-wsl| docker-win |
|--------------|-----------|------------|
| ~ 37 Gb/s    | ~ 42 Gb/s | ~ 2Gb/s    |

przepustowość spoza hosta jest o rząd wielkości mniejsza, co ciekawe, przepustowość z WSLa jest większa niż z sieci Dockerowej


## Instancja Jenkins
wykonujemy kroki z dokumentacji Jenkinsa

### tworzymy sieć i uruchamiamy obraz docker-in-docker
![](./20-jenkins-docker-image.PNG)

### tworzymy customowy obraz jenkinsa
![](./21-custom-image.PNG)

### uruchamiamy ten customowy obraz
uruchomione są dwa kontenery
![](./22-run.PNG)

### wchodzimy na `localhost:8080` i logujemy się hasłem z logów
![](./23-jenkins.PNG)

### pomyślnie zakończono procedurę, widzimy ekran startowy Jenkinsa
![](./24-home.PNG)


