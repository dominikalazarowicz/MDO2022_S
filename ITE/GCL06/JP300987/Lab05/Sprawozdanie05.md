SPRAWOZDANIE PIPELINE:

CEL:
Utworzenie pipeline''u w Jenkinsie, który zautomatyzuje czynności wykonane na poprzednich laboratoriach.

OPIS TEORETYCZNY:
Jenkins-

Pipileine-

Build-

Test-

Deploy-

Publish-

Artefakt-

WYKONANIE ĆWICZENIA:
Zgodnie z poprzednią instrukcją należy uruchomić Jenkinsa'a skonfigurowanego na poprzednich zajęciach. Najpierw należy uruchomić DIND:
s1

Następnie Jenkins:

s2

Uruchomione kontenery:
s3

Po zalogowaniu należy utworzyć Pipeline'a. Należy wybrać Nowy Projekt: 
s4

Dalej podać nazwę projektu oraz wybrać Pipeline:
s5

Następnie przejść do zakładki Pipeline i dla pola Definition wybrać Pipeline script from SCM, dla SCM Git, w polu Repository URL wkleić ścieżkę do repozytorium przedmiotu, w polu Credentials należy dodać własne konto github'owe wraz z danymi, w polu Branch Specifier należy wybrać własną gałąź, następnie w Script path wpisuje się ścieżkę do katalogu w którym jest Jenkinsfile:
s6
s7

W celu umożliwienia dostępu do artefaktów osobom niezalogowanym należy odpowiednio zmienić ustawienia:
s8


Parametry pipeline'u:
Pipeline został sparametryzowany dwiema zmiennymi. Najpierw należało określić wersję, czyli dopisek który został przyłączony do wygenerowanego artefaktu, następnie zmienna PROMOTE określała czy Publish się odbędzie:
s9

Etap Clone:
W tym kroku zostaje przygotowany obszar do późniejszego działania. Oprócz pozbycia się niepotrzebnych kontenerów następuje uruchomienie dockerfile'a, który ma za zadanie zbudować odpowiedni obraz kontenera. Potem obraz zostaje uruchomiony wraz z dołączeniem odpowiedniego woluminu wejściowego. Kontener zostaje uruchomiony wraz z odpowiednim wolumenem wejściowym oraz wyjściowym. Następnie zostaje wywołane budowanie projektu oraz skopiowanie uzyskanych danych z wolumenu wejściowego na wyjściowy.  
Jenkinsfile:
s10
Dockerfile:
s11

Etap Build:
Celem tego etapu jest zbudowanie projektu, który został sklonowany w poprzednim kroku. Obraz został zbudwany na podstawie dockerfile'a. Sklonowane repozytorium zostało stworzone z użyciem Maven'a z tego powodu kontener będzie korzystał z obrazu Maven'a. 
Jenkinsfile:
s12
Dockerfile:
s13

Etap Test:
W tym etapie zostają wykonane testy jednostkowe, poprwne ich wykonanie skutkuje wykonywaniem dalszych instrukcji. Kontener został zbudowany zgodnie z dockerfile'm, wykorzystany został obraz z poprzedniego etapu. Testy zostają uruchomione wraz z kontenerem, który ma podpięty wolumin wejściowy.
Jenkinsfile:
s14
Dockerfile:
s15

Etap Deploy:
W tym etapie nastąpiło sprawdzenie czy artefakt zawieta plik plugin.yml. Plik ten jest potrzebny do bezproblemowego działania pluginu na serwerze. Wyniki zbudowanego projektu zostają sprawdzone czy plik .jar został utworzony, następnie tylko on jest zostawiany. Następuje sprawdzenie czy ten plik zawiera plugin.yml, jeśli tak to deploy został przeprowadzony prawidłowo.
Jenkinsfile:
s16


Etap Publish:
W tym etapie następuje publikacja zdbuowanego aretfaktu. Jeśli zmienna PROMOTE przyjmuje wartość true plik zostanie wygenerowany.
Jenkinsfile:
s17

WNIOSKI: