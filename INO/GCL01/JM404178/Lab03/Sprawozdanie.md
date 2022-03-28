
# Sprawozdanie 3

1. Zdecydowalem sie na uzycie repozytorium, ktore bylo pokazywane jako przyklad na zajeciach, poniewaz po dluzszych poszukiwaniach- to, co znalazlem wazylo za duzo na sprawne uzycie go, wiec zostalem przy tym co zostalo juz nam zaprezentowane.

Wymaganiem takiego repozytorium bylo posiadanie otwartej licencji oraz mozliwosci przeprowadzenia testow. W tym celu uzywam **IRSSI**.

Przy polaczeniu sie do VM'ki za pomoca PUTTy, uruchamiam uprzednio pobrany docker ze srodowiskiem fedora `docker run -it fedora`. Aby moc uruchomic komendy potrzebne do sklonowania repo oraz kolejnych krokow, potrzeba jest zainstalowac 'zaleznosci' i 'pakiety', ktore nam na to pozwola.

![docker images](https://i.imgur.com/AO6XHoS.png)

![docker run n dependencies](https://i.imgur.com/bM17Fxm.png)

Kolejnym krokiem do wykonania jest sklonowanie repozytorium, co robimy za pomoca `git clone`. Dalej przechodzimy do katalogu z IRSSI i wywolujemy Mesona poleceniuem setup `meson setup build`.

![docker repo n meson](https://i.imgur.com/BEySyaG.png)

Teraz przechodzimy do katalogu build i odpalamy testy za pomoca komendy `meson test`.

![tests](https://i.imgur.com/AMZnd62.png)

Testy zostaly przeprowadzone.

2. Pozniej tworze dockerfile o nazwie **Docker-BLDR**, w ktorym umieszczam komendy (za pomoca edytora, w moim przypadku VIM) potrzebne do inicjalizacji wykonywania sie programu.

![Docker-BLDR](https://i.imgur.com/HnkIINc.png)

Kolejno tworzymy nowy obraz bldr z fedora, ktory bedzie uzywal pliku **Docker-BLDR** za pomoca komendy `docker build -t bldr_latest . -f ./Docker-BLDR`.

![1](https://i.imgur.com/qhUx13r.png)

![2](https://i.imgur.com/qub1bfa.png)

Uzywajac komendy `docker images` widzimy, ze istnieje taki obraz jak bldr.

![bldr](https://i.imgur.com/HAhbAt5.png)

3. Za pomoca `docker run -it` wchodze interaktywnie do dockera, aby pokazac, ze program zostal poprawnie zbudowany. Do udowodnienia, po przejsciu do katalogu build tego uzywam komend:

`ninja install`

![ninja install](https://i.imgur.com/frTgEzB.png)

`irssi`

![irssi](https://i.imgur.com/0oF9kya.png)

Teraz pozostalo utworzenie kolejnego dockerfile, ktory bedzie przeprowadzal testy. 

![DockerTEST](https://i.imgur.com/HNCPLWn.png)

Tworzymy nowy obraz na podstawie powyzszego dockerfile, i patrzymy czy testy sie wykonuja.

![run](https://i.imgur.com/OIYicn1.png)

Testy dzialaja, a sam obraz jest widoczny w `docker images`.

![images](https://i.imgur.com/Lc8cCPI.png)

