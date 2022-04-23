## Sprawozdanie Lab04
##### Autor: Dawid Gabryś

1. Na początku przygotowałem 2 woluminy: wejściowy ```volume1``` i wyjściowy ```volume2```:

![Screenshot 1](Screenshot_1.png)

Następnie podłączyłem je do kontenera i sprawdziłem występowanie:

![Screenshot 2](Screenshot_2.png)

Za pomocą poniższego polecenia sprawdziłem ścieżkę (poza tym wyświetlono również inne dane dotyczące odpowiedniego woluminu):

![Screenshot 3](Screenshot_3.png)

Potem chciałem sklonować repozytorium. Ze względu na brak dostępu:

![Screenshot 4](Screenshot_4.png)

Wykonałem polecenie z uprawnieniami administratora:

![Screenshot 5](Screenshot_5.png)

Ponownie uruchomiłem kontener, sprawdziłem zawartość ```v1``` i zainstalowałem odpowiednie programy i biblioteki, bez gita:

![Screenshot 6](Screenshot_6.png)

![Screenshot 8](Screenshot_8.png)

Uruchomiłem build w kontenerze:

![Screenshot 9](Screenshot_9.png)

Przeniosłem plik wykonywalny do wolumina wyjściowego i uruchomiłem go:

![Screenshot 7](Screenshot_7.png)

2. Następnie przeszedłem do etapu eksponowania portu. W tym celu:

Pobrałem obraz dockerowy i uruchomiłem go:

![Screenshot 10](Screenshot_10.png)

![Screenshot 11](Screenshot_11.png)

![Screenshot 12](Screenshot_12.png)

Zainstalowałem ```iperf3```:

![Screenshot 16](Screenshot_16.png)

Następnie uzyskałem adres IP serwera:

![Screenshot 14](Screenshot_14.png)

Oraz zainicjowałem połączenie klienta z innego kontenera:

![Screenshot 15](Screenshot_15.png)

Potem połączyłem się spoza kontenera (z hosta i spoza hosta):

Z hosta:

![Screenshot 17](Screenshot_17.png)

Spoza hosta:

![Screenshot 18](Screenshot_18.png)

Wszystkie uzyskane wyniki (wzięte z pierwszego uruchomionego kontenera):

![Screenshot 19](Screenshot_19.png)

![Screenshot 20](Screenshot_20.png)

![Screenshot 21](Screenshot_21.png)

Wyniki transferu uzyskane dla połączenia z drugiego kontenera oraz spoza kontenera z hosta są dosyć podobne. Natomiast transfer danych dla połączenia spoza kontenera spoza hosta jest wyraźnie mniejszy.

 

3. Instalacja Jenkins. Na początku, po zapoznaniu się z dokumentacją, przeprowadzono instalację:

Utworzono most (network bridge):

![Screenshot 22](Screenshot_22.png)

Pobrano i uruchomiono obraz docker:dind:

![Screenshot 23](Screenshot_23.png)

Utworzono plik Dockerfile i umieszczono w nim odpowiednie kroki do wykonania:

![Screenshot 25](Screenshot_25.png)

![Screenshot 24](Screenshot_24.png)

Potem zbudowano nowy obraz dockera z pliku Dockerfile oraz przypisano mu nazwę:

![Screenshot 26](Screenshot_26.png)

![Screenshot 27](Screenshot_27.png)

Uruchomiono obraz używając poniższego polecenia:

![Screenshot 33](Screenshot_33.png)

Następnie wchodząc na ```localhost:8080``` odblokowałem za pomocą hasła Jenkinsa:

![Screenshot 28](Screenshot_28.png)

![Screenshot 29](Screenshot_29.png)

Zainstalowano domyślnie wtyczki:

![Screenshot 30](Screenshot_30.png)

W celu wykazania działających kontenerów wykonałem poniższe polecenie:

![Screenshot 32](Screenshot_32.png)

Oraz pokazałem stronę logowania:

![Screenshot 31](Screenshot_31.png)
