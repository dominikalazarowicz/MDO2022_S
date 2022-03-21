
# Sprawozdanie 2

1.  Aby utworzyc hook'a, ktory sprawdza czy tytul commit'a sie zgadza oraz czy posiada podana nazwe laboratorium- najpierw udajemy sie do zakladki `.git/hooks`, gdzie znajdziemy plik **commit-msg.sample**. Kolejno, aby wlaczyc tego hook'a, zmieniamy nazwe tego pliku na ta sama, lecz tym razem bez koncowki **.sample**.

![commit-msg](https://imgur.com/L7E8I8e.jpg)

Nastepnie, aby sam hook zaczal robic to, co chcemy, musimy mu napisac skrypt wlasnie w tym pliku.

![code](https://imgur.com/T5yJcA6.jpg)

Teraz, aby commit przeszedl, musi on miec tytul: `<inicjały><numer indeksu>`, a tresc commita musi miec w sobie `Lab[00-99]`

![commit](https://imgur.com/5mtZ6z7.jpg)

**Testy**

Poprawny commit:

![Good commit](https://imgur.com/WDDaOKU.jpg)

Niepoprawny tytul:

![Bad title](https://imgur.com/WJTUT40.jpg)

Niepoprawna tresc:

![Bad lab name](https://imgur.com/E2a9Dye.jpg)

Sama tresc poprzedniego commit'u znajduje sie w pliku, ktory znajdziemy w `.git/COMMIT_EDITMSG'`

![commit_editmsg](https://imgur.com/UkDwLIR.jpg)

2. Plik **commit-msg** znajduje sie w folderze `Lab02`.

3. W celu zapewnienia dostepu do VM'ki przez zdalny terminal, pobralem PuTTy.
Powinnismy zainstalowac serwer SSH za pomoca komendy `sudo apt install openssh-server`.
W ustawieniach maszyny wirtualnej musimy dodać druga karte sieciowa, ustawiona na karte izolowana, abysmy mogli sie z nia polaczyc.

![VM Settings](https://imgur.com/emaXx3h.jpg)

Polaczenie sie z VM'ka za pomoca zdalnego terminala.

![PuTTy connected](https://imgur.com/yuBy5Gp.jpg)

Instalacja srodowiska dockerowego na maszynie Ubuntu wyglada nastepujaco:
`sudo apt install apt-transport-https ca-certificates curl software-properties-common`
`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - `
`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"`
`sudo apt update sudo apt install docker-ce`

4. Do sprawdzenia aktualnej wersji docker'a mozemy uzyc komendy `docker -v`

![Docker Version](https://imgur.com/o6Uthpz.jpg)

Samo srodowisko dziala:

![Hello world](https://imgur.com/9y5KEJD.jpg)

Jako ze uzywam Ubuntu na VM'ce, to pobieram Fedore za pomoca komendy `sudo docker pull fedora`
Zrobilem juz to wczesniej, a sam obraz widac przy uzyciu komendy `docker images`

![images](https://imgur.com/355ZbCD.jpg)

Interaktywne wejscie do kontenera gwarantuje nam komenda `sudo docker run -it fedora`
Po wejsciu do kontenera, mozemy sprawdzic za pomoca komendy `uname -v`, ze kernel to Ubuntu, a w miejscu `etc/os-release` mamy plik, w ktorym znajduje sie wersja OS (w moim przypadku Fedora).

![RunNProof](https://imgur.com/iC3xI38.jpg)

5. Docker account

![Docker Account](https://imgur.com/3zBmExl.jpg)


