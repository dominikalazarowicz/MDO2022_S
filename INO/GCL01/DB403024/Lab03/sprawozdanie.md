# Lab 3

- Po stworzeniu folderu Lab03 w odpowiednim folderze odpaliłem z Putty'ego fedore uzywajac polecenia `docker run -it fedora`, a następnie pobrałem dependency oraz zassałem repo z gita. Wybrałem to samo repo które było używane podczas demonstracji na zajęciach, ponieważ jest to bardzo convenient. Poniżej screeny z builda, testu oraz historii komend:

![fota](manualbuild.png)

![fota](manualtest.png)

![fota](dockerhistory.png)

- Stworzyłem 2 pliki Dockerfile: `Docker1`:

![fota](docker1.png)

oraz `Docker2`:

![fota](docker2.png)

- Użyłem polecenia `docker build -f docker1:latest . -f Docker1` aby odpalić kontener z załączeniem pierwszego pliku Dockerfile.

![fota](dockerbuild1.png)

![fota](images1)

- Aby wykazać poprawne zbudowanie programu, w kontenerze zainstalowałem irssi używając wczesniej zbudowanego repo:

![fota](historyirssi.png)

![fota](irssi.png)
