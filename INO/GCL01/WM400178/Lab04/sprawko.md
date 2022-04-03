## Sprawozdanie - lab 04 - 400178
## Woluminy
Jeśli chodzi o kontener podstawowy, to w przeciwieństwie do poprzednich zajęć, użyłem kontenera node:slim. tag slim oznacza, że jest do wersja z mniejszą ilością dependencji niż wersja latest oraz m.in nie poisiada ona gita. Dodatkowo, w trakcie wykonywania ćwiczenia, na zmiane posługiwałem się terminalem gitowym oraz cmd, poniewaz w niektórych przypadkach mój domyślny terminal (gitowy), wyrzucał dziwne błędy - m.in przy tworzeniu woluminów.
1. Utworzenie woluminu wejścioweg i wyjściowego
    # ![Alt text](1-volumes-create.PNG?raw=true)
2. Uruchomienie kontenera z node:slim z woluminami
   # ![Alt text](1-node-slim-with-voluimes.PNG?raw=true)
3. Woluminy z poziomu kontenera:
    # ![Alt text](3-volumes-created-container.PNG?raw=true)
4. Skopiowałem repozytorium nodejs.org do wolumina  wejściowego:
    # ![Alt text](4-repo-on-volin-windows.PNG?raw=true)
5. Potwierdzenie, ze repo znadjuje sie teraz w kontenerze i że nie ma gita:
    # ![Alt text](5-potw.PNG?raw=true)
6. Wykonałem npm ci i run build w kontenerze:
    # ![Alt text](6-npm-ci.PNG?raw=true)
    # ![Alt text](7-run-build.PNG?raw=true)
7. Przekopiowałem wynik builda do wolumina wyjściowego:
    # ![Alt text](8-cp.PNG?raw=true)
    # ![Alt text](9-local.PNG?raw=true)
## iperf3
Z tym zadaniem miałem niemały problem,nie udało mi się ukończyć całego zadania, ponieważ nie mogłem połączyć się do serwera z poza kontenera. 
9. Uruchomienie serwera iperf3 w kontenerze:
    # ![Alt text](10-iperf.PNG?raw=true)
10. potwierdzenie, że serwer nasłuchuje na tym porcie:
    # ![Alt text](11-nasluchuje.PNG?raw=true)
11. Połączyłem się z innego kontenera, dodałem flagę -c która określa, że jesteśmy klientem. Adres z flagi wziąłem bezsporednio z kontenera, według instrukcji z dockerhuba:
    # ![Alt text](12-connection.PNG?raw=true)
12. Wyciągnąłem logi z kontenera
    # ![Alt text](13-iplogs.PNG?raw=true)
13. W końcu napotkałem błąd, z którym walczyłem ponad 2 godziny, niestety nie udało mi się go rozwiązać. Pobrałem plik .exe z oficjalnej strony iperf, tak abym mógł uruchomic serwer jako klient, jednak nie udało mi się połączyć. Dodam, że mogłem odpalić iperf3 jako server - nie działał tylko klient. Nie mogłem wobec tego sprwadzić przepustowości.
    # ![Alt text](14-blad.PNG?raw=true)
Tak więc udało mi się połączyć tylko z poziomu innego kontenera, gdzie bitrate wynosił 19.9 Gbits/sec. Próbowałem także zmieniac  ustawienia firewalla oraz otwierać port, jednak to też nie przyniosło efektów.
## Jenkins
14. Przystąpiłem do czytania dokumentacji Jenkinsa z oficjalnej strony i kierowałem się poradnikiem dla Windowsa.
15. Utworzyłem sieć dla Jenkinsa:
    # ![Alt text](15-jenkins-network.PNG?raw=true)
16. Uruchomiłem docker:dind
    # ![Alt text](16-jenkins-dockerrun.PNG?raw=true)
17. Skopiowałem dockerfile ze strony:
    # ![Alt text](17-dockerfile.PNG?raw=true)
18. uruchomiłem dockerfile:
    # ![Alt text](18-jenkins-dockerfile.PNG?raw=true)
19. Na porcie 8080 od teraz mam UI Jenkinsa, przystąpiłem do instalacji standartowych pakietów i założenia konta
    # ![Alt text](19-wizard.PNG?raw=true)
20. Po setupie i wyciągnięciu hasła, mam od teraz możliwośc logowania:
    # ![Alt text](20-login.PNG?raw=true)
21. Panel użytkownika:
# ![Alt text](21-welcome.PNG?raw=true)
