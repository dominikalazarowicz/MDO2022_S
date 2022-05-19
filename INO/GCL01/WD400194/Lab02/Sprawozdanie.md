# Zajęcia 02 Sprawozdanie
### 14.03.2022
---
Pierwszym krokiem, który wykonałam było dostanie się do katalogu `.git`, a w następnej kolejności do podkatalogu `hooks`

![screen1](./screen1.png)

Następnie przeszłam do edycji pliku `commit-msg.sample`, w ten sposób tworząc plik `hook`, sprawdzający czy tytuł commita nazywa się `WD400194`. W przeciwnym razie proces tworzenia commita jest przerywany.

![screen2](./screen2.png)

Zmieniłam nazwę pliku `commit-msg.sample` na `commit-msg`.

![screen3](./screen3.png)

Stworzyłam plik testowy `test.txt` i sprawdziłam działanie skryptu dla niewłaściwego tytułu oraz dla tytułu `WD400194`.

![screen4](./screen4.png)
![screen5](./screen5.png)

Następnie stworzyłam kolejny `hook`, sprawdzający czy w treści commita pojawia się numer labu. Najpierw zaczęłam od edycji pliku `pre-commit.sample` z podkatalogu `hooks`.

![screen6](./screen6.png)

Identycznie jak wcześniej, zmieniłam nazwę pliku `pre-commit.sample` na `pre-commit`.

![screen7](./screen7.png)

Stworzyłam kolejny plik testowy `test2.txt` i sprawdziłam działanie skryptu dla niewłaściwej treści commita oraz dla treści zawierającej numer labu (Spr02)

![screen8](./screen8.png)
![screen9](./screen9.png)

W następnym kroku przeszłam do rozpoczęcia wykonania trzeciego podpunktu. Za pomocą poniższej komendy sprawdziłam status OpenSSH servera:

```bash
$ sudo systemctl status ssh
```
![screen9a](./screen9a.png)

Za pomocą `ifocnfig` sprawdziłam ip, potrzebne w celu połączenia się przez ssh.

![screen10](./screen10.png)

Dzięki programowi `PuTTY` połączyłam się z maszyną wirtualną.

![screen11](./screen11.png)

Następnie zalogowałam się.

![screen12](./screen12.png)

Kolejnym wykonanym przeze mnie krokiem była instalacja dockera. Za pomocą poniższej komendy nastąpiła aktualizacja list paczek z repozytoriów:

```bash
$ sudo apt-get update
```

![screen13](./screen13.png)

Następnie potrzebne było doinstalowanie szeregu wymaganych dependencji poprzez komendę:

```bash
$ sudo apt-get install \
>     ca-certificates \
>     curl \
>     gnupg \
>     lsb-release
>   
```

![screen14](./screen14.png)
![screen14a](./screen14a.png)

Później dodałam oficjalne klucze GPG Dockera za pomocą:

```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
![screen14b](./screen14b.png)

Natomiast repozytorium ustawione zostało przeze mnie na `stable`:

```bash
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

![screen14c](./screen14c.png)

Następnie zainstalowałam Docker Engine poprzez komendę:

```bash
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

![screen15](./screen15.png)
![screen15a](./screen15a.png)

W kolejnym kroku przeszłam do wykonania podpunktu czwartego. Uruchomiłam środowisko dockerowe oraz sprawdziłam jego działanie:

```bash
$ sudo service docker start
$ sudo service docker status
```
![screen17](./screen17.png)

Uruchomiłam obraz `hello-world` przy pomocy komendy:

```bash
$ sudo docker run hello-world
```
![screen18](./screen18.png)

Pobrałam obraz dystrybucji linuksowej i uruchomiłam go:

```bash
$ sudo docker run ubuntu
```
![screen19](./screen19.png)

Następnie sprawdziłam pobraną wersję obrazu Ubuntu:

```bash
$ sudo docker images
```
![screen20](./screen20.png)
![screen21](./screen21.png)

Na koniec założyłam konto na **Docker Hub** .

![screen22](./screen22.png)
![screen23](./screen23.png)


