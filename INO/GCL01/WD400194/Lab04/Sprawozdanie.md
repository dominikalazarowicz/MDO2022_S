# Sprawozdanie Lab04
### 28.03.2022
---
## Zachowywanie stanu

Na początku zaczęłam od przygotowania woluminu wejściowego oraz wyjściowego o nazwach `volin` i `volout` używając komendy `sudo docker volume create` .

![screen1](./screen1.png)

![screen2](./screen2.png)

Następnie przy pomocy `sudo docker volume inspect` wyświetliłam szczegóły o obydwu woluminach (w szczególności ścieżkę, która będzie potrzebna w kolejnych krokach) .

![screen3](./screen3.png)

Uruchomiłam kontener z woluminami poprzez `sudo docker run` . Wyświetliłam odpowiednie katalogi `vin` oraz `vout`, więc wykazane zostało zamontowanie ich w kontenerze.

![screen5](./screen5.png)

![screen6](./screen6.png)

Następnie sklonowałam repozytorium na wolumin wejściowy `volin` (wykonałam to z poziomu roota) używając `git clone` i odpowiedniej ścieżki z wcześniejszego kroku.

![screen7](./screen7.png)

Będąc w kontenerze widać sklonowane repozytorium:

![screen8](./screen8.png)

Pobrałam zależności za pomocą `npm install` .

![screen9](./screen9.png)

Uruchomiłam build w kontenerze poprzez użycie `npm run build`.

![screen10](./screen10.png)

![screen11](./screen11.png)

Następnie powstałe pliki zostały zapisane na woluminie wyjściowym `vout` .

![screen12](./screen12.png)

![screen13](./screen13.png)

## Eksponowanie portu

W następnym kroku przeszłam do uruchomienia wewnątrz kontenera serwera iperf (iperf3). Na początek jednak musiałam poszukać odpowiedniego obrazu dockerowego. Dzięki poleceniu `sudo docker pull networkstatic/iperf3` pobrałam go i następnie uruchomiłam. 

![screen14](./screen14.png)

![screen16](./screen16.png)

Widoczny obraz dockerowy po wpisaniu `sudo docker images`:

![screen15](./screen15.png)

Sprawdziłam także, czy serwer nasłuchuje poprzez `sudo netstat` .

![screen17](./screen17.png)

Następnie sprawdziłam IP serwera za pomocą `sudo docker inspect`.

![screen18](./screen18.png)

W kolejnym kroku przeszłam do połączenia się z serwerem z drugiego kontenera. Uruchomiłam kontener podobnie jak wcześniej i określiłam działanie jako client. Połączenie zostało nawiązane.

![screen19](./screen19.png)

Następnie przeszłam do połączenia spoza kontenera (z hosta i spoza hosta). Najpierw jednak zainstalowałam iperf3 na hoscie za pomocą `sudo apt install iperf3` .

![screen20](./screen20.png)

Jako pierwsze sprawdziłam połączenie z hosta.

![screen21](./screen21.png)

Połączenie zostało nawiązane.
Na koniec sprawdziłam połączenie spoza hosta.Przetestowałam to z mojego komputera z systemem Windows 10.

![screen21a](./screen21a.png)

Następnie przeszłam do przedstawienia przepustowości komunikacji, poprzez wyciągnięcie logów z kontenera.

![screen22](./screen22.png)

![screen22a](./screen22a.png)

Podsumowując, największa przepustowość występowała pomiędzy jednym i drugim kontenerem. Niewiele mniejszy transfer danych występował pomiędzy hostem a kontenerem (minimalna różnica), natomiast najniższy wynik został uzyskany dla transferu pomiędzy komputerem zewnętrznym z Windowsem a kontenerem. 

## Instancja Jenkins

Najpierw zapoznałam się z dokumentacją https://www.jenkins.io/doc/book/installing/docker/ .

![screen23](./screen23.png)

Następnie przeszłam do instalacji skonteneryzowanej instancji Jenkins z pomocnikiem DIND. Zaczęłam od utworzenia nowej sieci dockerowej przy użyciu polecenia `sudo docker network create jenkins`.

![screen24](./screen24.png)

W dalszych krokach postępowałam zgodnie z poleceniami podanymi w dokumentacji. Pobrałam i uruchomiłam obraz DIND kontenera.

![screen25](./screen25.png)

Później używając `touch` stworzyłam plik Dockerfile. `FROM` wskazuje na dziedziczenie z obrazu `jenkins/jenkins: 2.332.1-jdk11` przez kontener. `USER` wskazuje na użytkownika tj. root, natomiast `RUN` wykonuje dane polecenia w kontenerze.

![screen25a](./screen25a.png)

![screen26](./screen26.png)

Następnie uruchomiłam build przy pomocy `sudo docker build` określając za pomocą `-t` nazwę powstałego obrazu.

![screen27](./screen27.png)

![screen27a](./screen27a.png)

![screen28](./screen28.png)

Stworzony obraz został przeze mnie uruchomiony.

![screen29](./screen29.png)

Pokazałam także, że instancja Jenkinsa jest uruchomiona, wchodząc wcześniej na adres localhost:8080 .

![screen30](./screen30.png)

W następnym kroku odczytałam hasło. Użyłam `sudo docker exec` do uruchomienia interaktywnego terminala na kontenerze, który jest aktywny. Dzięki `cat` odczytałam hasło.

![screen31](./screen31.png)

Zalogowałam się i zainstalowałam zalecane wtyczki.

![screen32](./screen32.png)

Na koniec wykazałam, że kontenery działają używając polecenia `sudo docker ps` .

![screen32a](./screen32a.png)

Zgodnie z instrukcją, pokazałam ekran logowania.

![screen33](./screen33.png)


