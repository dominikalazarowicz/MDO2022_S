# Lab 3

- Po stworzeniu folderu Lab03 w odpowiednim folderze odpaliłem z Putty'ego fedore uzywajac polecenia `docker run -it fedora`, a następnie pobrałem dependency oraz zassałem repo z gita. Wybrałem to samo repo które było używane podczas demonstracji na zajęciach, ponieważ jest to bardzo convenient. Poniżej screeny z builda, testu oraz historii komend:

![fota](manualbuild.png)

![fota](manualtest.png)

![fota](dockerhistory.png)

- Stworzyłem 2 pliki Dockerfile: `Docker1`:

![fota](Docker1.png)

oraz `Docker2`:

![fota](Docker2.png)

- Użyłem polecenia `docker build -f docker1:latest . -f Docker1` aby stworzyć kontener z załączeniem pierwszego pliku Dockerfile.

![fota](dockerbuild1.png)

![fota](images1.png)

- Aby wykazać poprawne zbudowanie programu, w kontenerze zainstalowałem irssi używając wczesniej zbudowanego repo:

![fota](historyirssi.png)

![fota](irssi.png)

- następnie wykonałem `docker build -t docker2:latest . -f Docker2` aby z drugim Dockerfile stworzyć build z testami

![fota](testy.png)

![fota](images2.png)

- Jak widać testy przeszły, jako że obraz ten zbudowany jest na podstawie poprzedniego, który działa wnioskuje że ten też musi śmigać aż miło.
