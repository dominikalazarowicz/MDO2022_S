Zachowywanie stanu:
1. Przygotowuję wolumin wejściowy i wolumin wyjściowy i podłączam je do kontenera bazowego, którym w moim przypadku jest kontener oparty na openjdk:16-jdk-alpine:
![img.png](img.png)
![img_1.png](img_1.png)
![img_2.png](img_2.png)
2. Nie instaluję żadnych zależności, ponieważ ich nie potrzebuję.
3. Uruchamianie kontenera na bazie obrazu alpine z podpiętym ovlumenem input:
![img_5.png](img_5.png)
4. Klonuję repozytorium na wolumin wejściowy przy pomocy nowo utworzonego obrazu z podpiętym tym samym volumenem wejściowym:
![img_3.png](img_3.png)
Widok foleru input z poziomu kontenera "builder":
![img_4.png](img_4.png)
5. Uruchomienie budowania projektu w kontenerze "builder":
![img_6.png](img_6.png)
6. Zapisuję zbudowany plik .jar w folderze /output w kontenerze "builder":
![img_7.png](img_7.png)
7. Sprawdzam dostępność zbudowanego pliku .jar z poziomu hosta:
![img_8.png](img_8.png)

Eksponowanie portów:
1. Stworzone zostały dwa kontenery na bazie obrazu alpine. Na obu zainstalowany został program iperf3:
![img_10.png](img_10.png)
2. Na jednym z nich został uruchomiony iperf3 w trybie serwera z nasłuchiwaniem na porcie 9000:
![img_11.png](img_11.png)
3. Drugi natomiast w trybie klienta połączony został z serwerem na podstawie ip:
Jak widać komunikacja zakończona została sukcesem.
![img_12.png](img_12.png)
4. Powtórzyłem poprzedni krok - tym razem klientem był host - ubuntu.
![img_13.png](img_13.png)
5. Z powyższych zrzutów ekranu możemy odczytać, że przepustowość wynosi:<br>
a) w przypadku komunikacji Container -> Container: około 6,2GB/s,<br>
b) w przypadku komunikacji Host -> Container: około 6,8GB/s.

Jenkins:
1. Tworzę nową sieć dla jenkinsa:
![img_14.png](img_14.png)
2. Używająć komendy z dokumentacji Jenkinsa tworzę kontener docker:dind:
![img_15.png](img_15.png)
3. Stworzyłem plik Dockerfile customizujący oficjalny obraz Jenkinsa:
![img_16.png](img_16.png)
4. Zbudowałem obraz z powyższego pliku Dockerfile również wykorzystując komendę z dokumentacji:
![img_17.png](img_17.png)
5. Używająć poniższej komendy uruchomiłem własny obraz jenkinsa jako kontener:
![img_18.png](img_18.png)
6. Na poniższym screenie prezentuję poprawnie działające kontenery związane z jenkinsem:
![img_19.png](img_19.png)
7. Przystępuję do instalacji jenkinsa poprzez otworzenie interfejsu graficznego w przeglądarce pod adresem localhost:8080:
Skopiowałem hasło wypisane w logach kontenera aby odblokować jenkinsa, a następnie uruchomiłem zalecaną instalację pluginów:
Następnym krokiem było stworzenie administratora:
![img_20.png](img_20.png)
8. Instalacja zakończona sukcesem:
![img_21.png](img_21.png)
![img_22.png](img_22.png)
