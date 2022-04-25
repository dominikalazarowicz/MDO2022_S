#Sprawozdanie 4
Anna Godek
**ZACHOWANIE STANU**
1. Przygotowano woluminy wejściowy i wyjściowy o nazwach `volin` oraz `volout`. Wykorzystano komendę `sudo docker volume create`.
![volumeCreate](volumeCreate.png)
 
2. Następnie uruchomiono kontener z woluminami za pomocą `sudo docker run` i wyświetlono odpowiednie katalogi `vin` i `vout`.
![runFirst](runFirst.png)
 
3. Wyświetlono szczegóły o obu woluminach oraz ścieżkę, która będzie potrzebna w następnym kroku. Wykorzystano komendę `sudo docker volume inspect`.
![volumeInspect](volumeInspect.png)
 
4. Z poziomu roota skopiowano repozytorium na wolumin wejściowy `volin` z wykorzystaniem ścieżki z poprzedniego kroku oraz polecenia `git clone`.
![gitClone](gitClone.png)
 
W kontenerze widoczne jest sklonowane repozytorium:
![repo](repo.png)
 
5. Do wykonania builda w kontenerze konieczne było doinstalowanie `make`, `gcc` oraz biblioteki `ncurses`.
![update&install](update&install.png)
 
![make](make.png)
 
6. Zapisano pliki w woluminie wyjściowym.
```bash
# cp -r pcalc /../../vout
```
![vout](vout.png)
 
**EKSPORTOWANIE PORTU**
1. W następnym zadaniu pierwszym krokiem było pobranie i uruchomienie odpowiedniego obrazu dockerowego.
![iperf3](iperf3.png)
 
![jest](jest.png)
 
2. Sprawdzono za pomocą `sudo netstat` nasłuchiwanie serwera.
![netstat](netstat.png)
 
3. Sprawdzono IP serwera za pomocą polecenia:
```bash
$ sudo docker inspect --format "{{ .NetworkSettings.IPAddress }}" iperf3-server
```
![IP](IP.png)
 
4. Połączono się z serwerem z drugiego kontenera, którego działanie określono jako client.
![zKontenera](zKontenera.png)
 
W celu połączenia się spoza kontenera (z i spoza hosta) najpierw zainstalowano iperf3.
```bash
$ sudo docker inspect --format "{{ .NetworkSettings.IPAddress }}" iperf3-server
```
![iperf3install](iperf3install.png)
 
Połączenie z hosta:
![zHosta](zHosta.png)
 
Połączenie spoza hosta (komputer z systemem Windows 10):
![spozaHosta](spozaHosta.png)
 
5. Na koniec wyciągnięto logi z kontenera aby przedstawić przepustowość komunikacji.
![log1](log1.png)
 
![log2](log2.png)
 
![log3](log3.png)
 
Uzyskane wyniki wskazują na to, że największą przepustowość uzyskano między kontenerami. Niewiele mniejszy rezultat otrzymano dla transferu między hostem a kontenerem. Wyraźnie najniższą przepustowość uzyskano dla transferu spoza hosta. 

**INSTALACJA JENKINS**
1. Utworzono nową sieć dockerową. 
```bash
$ sudo docker network create jenkins
```
![jCreate](jCreate.png)
 
2. Pobrano i uruchomiono obraz DIND kontenera.
![jDIND](jDIND.png)
 
3. Utworzono Dockerfile. 
![jDockerfile](jDockerfile.png)
 
4. Zbudowano nowy obraz dockera z pliku Dockerfile określając za pomocą `-t` nazwę.
![jbuild](jbuild.png)
 
![jdone](jdone.png)
 
![jImages](jImages.png)
 
5. Uruchomiono stworzony obraz.
![jRun](jRun.png)
 
6. Sprawdzono adres localhost:8080 i odblokowano za pomocą hasła.
![jBlocked](jBlocked.png)
 
Aby odczytać hasło uruchomiono najpierw interaktywny terminal za pomocą `sudo docker exec`, polecenie `cat` pozwoliło na odczytanie już samego hasła.
![jPassword](jPassword.png)
 
7. Zainstalowano zalecane wtyczki.
![jWtyczki](jWtyczki.png)
 
8. Za pomocą polecenia `sudo docker ps` wykazano działanie kontenerów.
![jdockerPS](jdockerPS.png)
 
![jWorks](jWorks.png)
 

