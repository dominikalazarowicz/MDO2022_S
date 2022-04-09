##DevOps Sprawozdanie 03

Wybrałem projekt nodejs.org- projekt ten spełnia wymagania zawarte w instrukcji do sprawozdania (otwarta licencja oraz zawiera testy). Link do repozytorium https://github.com/nodejs/nodejs.org.git .

Wykonywanie zadań rozpocząłem od użycia **git clone** w celu sklonowania repozytorium do nowo utworzonego folderu **lab3**:
![clone](01 clone.png)

Następnie zainstalowałem menedżera pakietów poprzez komendę **npm install**. Następnie zbudowałem program i uruchomiłem testy komendami **npm run build** oraz **npm run test**:
![install]](02 npm install.png)
![build](03 build.png)
![test](04 test.png)
![test2](05 test.png)

Połączyłem się programem PuTTY przy użyciu protokołu SSH ze swoją wirtualną maszyną, w celu pobrania obrazu node komendą **sudo docker pull node**:
![pull node](06 pull node.png)

Uruchomiłem kontener i podłączyłem się do niego poprzez komendę **sudo docker run --interactive --tty node sh**. Następnie w kontenerze powtarzam wcześniejsze działania- klonuje repozytorium, buduje program i uruchamiam testy:
![clone](07 clone.png)
![install]](08 npm install.png)
![build](09 build.png)
![test](10 test.png)
![test2](11 test.png)

Następnie należało stworzyć dwa pliki Dockerfile do zautomatyzowania poprzednich kroków. Pierwszy plik dockerfile ma za zadanie zbudować program:
![docker1](12 docker1.png)
Gdzie:
**FROM**- wybór obrazu
**RUN**- uruchomienie komendy
**WORKDIR**- ustawienie ścieżki roboczej

Następnie użyłem komendy **sudo docker build . -f dockerfile1.dockerfile -t build1** aby zbudować docker o nazwie build1 przy pomocy stworzonego pliku dockerfile:
![dockerbuild](13 dockerbuild11.png)
![dockerbuild](14 dockerbuild12.png)

Drugi plik Dockerfile wykonujący test:
![docker2](15 docker2.png)

Użycie komendy **sudo docker build . -f dockerfile2.dockerfile -t build2** aby zbudować docker o nazwie build2 przy pomocy stworzonego pliku:
![dockerbuild](16 dockerbuild21.png)
![dockerbuild](17 dockerbuild22.png)
![dockerbuild](18 dockerimages.png)

Następnie wykazałem, że dany kontener hostuje stronę na porcie 8080:
![magia kontenerów](19 npmstart.png)