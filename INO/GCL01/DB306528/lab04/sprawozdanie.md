##DevOps Sprawozdanie 04


Całość rozpocząłem od stworzenia dwóch woluminów- wejściowego oraz wyjściowego. W tym celu użyłem komendy **sudo docker volume create** ***nazwa*** .
![volume create](01 create.png)

Wyświetliłem ścieżkę do woluminów poprzez **sudo docker volume inspect**
![volume inspect](02 inspect.png)

Uruchomiłem kontener z woluminami **sudo docker run --mount**. (zdjęcie zrobione później)
![docker mount](03 mount.png)

Następnie sklonowałem repozytorium na wolumin wejściowy **volumin**. Zrobiłem to z poziomu roota, używając git clone i wcześniej sprawdzonej ścieżki.
![klonowanie repo z poziomu roota na wolumin wejściowy](04 clonein.png)

Sklonowane repozytorium:
![pięknie widać że wszystko istnieje](05 sklonowane repo.png)

Pobrałem zależności za pomocą **npm install**:
![npm install](06 npminstall.png)

Użyłem komendy **npm run build**, w celu uruchomienia builda w kontenerze:
![run build](07 npmrunbuild.png)

Skopiowałem folder build do katalogu volout:
![skopiowanie folderu build z zawartością](08 copyout.png)

Pliki z woluminu wyjściowego są i mają się dobrze:
![pliki w woliminie wyjściowym](08 data.png)

#Eksponowanie portu

W następnym kroku uruchomiłem serwer iperf (iperf3) wewnątrz kontenera. Na początek poszukałem odpowiedniego obrazu dockerowego. Użyłem polecenia **sudo docker pull networkstatic/iperf3**, pobrałem go i następnie uruchomiłem
![pobranie obrazu dockerowego](09 pull iperf3.png)
![uruchomienie](10 uruchomienie.png)

Sprawdzenie nasłuchu:
![nasłuchujące porty](11 nasluch.png)

Sprawdzenie IP serwera **sudo docker inspect**:
![IP servera](12 IP.png)

W kolejnym kroku połączenie się z serwerem z drugiego kontenera. Nawiązane połączenie:
![no i ładnie i pięknie](13 iperfdone.png)

Następnie połączenie spoza kontenera (z hosta i spoza hosta). Najpierw zainstalowałem iperf3 na hoście. Sprawdzenie połączenia z hosta:
![iperf na hoście](14 iperfhost.png)

logi z kontenera:
![logi z kontenerzyska](15 listening.png)

Połączenie się z zewnątrz z systemu windows 10 (zdjęcie z logami):
![iperf z windy i logi do połączenia](16 win10connect.png)

Podsumowując, największa przepustowość występowała w przypadku połączenia pomiędzy kontenerami, oraz w przypadku połączenia pomiędzy hostem a kontenerem (nieduże różnice). Jednoznacznie najniższy wynik został uzyskany dla transferu pomiędzy komputerem zewnętrznym z Windowsem a kontenerem (około 10 razy niższy).

JENKINS
Według polecenia zapoznałem się z dokumentacją https://www.jenkins.io/doc/book/installing/docker/.
Zainstalowałem skonteneryzowaną instancję jenkinsa z pomocnikiem DIND. Zacząłem od utworzenia nowej sieci dockerowej poprzez **sudo docker network create jenkins**:
![create jenkins](17 create jenkins.png)

Następnie postępowałem zgodnie z poleceniami podanymi w dokumentacji. Pobranie i uruchomienie obrazu DIND kontenera:
![komendy](18 commands.png)

Stworzenie Dockerfile poprzez **touch** i edytowanie go według instrukcji z linku. 
![Dockerfile](19 dockerfile.png)

Uruchomienie builda poprzez **sudo docker build -t** (-t do określenia nazwy nowego obrazu)
![pierwszy part budowania](20 blueocean.png)
![ostatni part budowania](21 blueocean.png)

Uruchomienie stworzonego obrazu:
![uruchomienie](22 uruchomienie.png)

Instancja Jenkinsa została uruchomiona:
![widać ze działa pięknie](23 odpalone.png)

Następnie odczytałem hasło. Użyłem **sudo docker exec** aby uruchomić interaktywny terminal na kontenerze, który jest aktywny. Dzięki cat odczytałem hasło:
![odczytanie hasła](24 passy.png)

Zainstalowałem zalecane wtyczki:
![instalacja zalecanych wtyczek](25 instalacjawtyczek.png)

No i na sam koniec ekran zalogowanego jenkinsa oraz ekran logowania do jenkinsa:
![zalogowane](26 jenkinsloggedin.png)
![wylogowane](27 jenkinsloggedout.png)