# Zajęcia 02
### 14.03.2022
---

Najpierw przygotowano pliki `git hook`, czyli dodatkowe skrypty, które można skonfigurować pod konkretne zastosowanie.

Plik `hook` sprawdzający tytuł commita napisano wykorzystując skrypt `commit-msg` z folderu `.git/hooks`, ten skrypt uruchamiany jest w trakcie tworzenia wiadomości commita i otrzymuje jako argument nazwę pliku z treścią commita. Skrypt ten przerywa proces tworzenia commita jeżeli nazwa nie jest równa **KS404423**. Do napisania kodu wykorzystano `sh`:

```sh
#!/bin/sh
#
# A hook script to check if the commit log message equals KS404423.
# If it's not it exit with 1 otherwise returns 0.

echo "Testing if the commit message equals KS404423..."

if test $(cat $1) = KS404423
then
  echo "Success"
else
  echo "Failure"
  exit 1
fi
```

Polecenia i zmienne:

* `echo` - wypisuje tekst
* `test` - porównuje wartości
* `cat` - odczytuje wartość pliku
* `$1` - zmienna przechowująca wartość przekazaną do skryptu (nazwa pliku z treścią commita)

Dalej napisano `hook` sprawdzający treść commita, do tego wykorzystano skrypt `pre-commit` również z folderu `.git/hooks`, skrypt ten wywoływany jest jako pierwszy, przed utworzeniem wiadomości. Używany jest do weryfikacji informacji, które mają zostać dołączone do commita. Skrypt ten sprawdza czy gdziekolwiek w zmianach zapisanych w commitcie przechowywana jest wartość **02** (numer laboratorium). Jeżeli taka wartość nie zostanie znaleziona, skrypt przerywa proces tworzenia commita.

```sh
#!/bin/sh
#
# A hook script to verify if the commit content contains lab number.
# On failure it returns 1 otherwise 0.

echo "Testing if the content of this commit contains lab number - 02..."

if git diff --cached | grep "02"
then
  echo "Success"
else
  echo "Failure"
  exit 1
fi
```

Polecenia:

* `git diff` - pokazuje różnicę pomiędzy commitami, zmianami
  * `--cached` - pokazuje zmiany przygotowane do dodania do commita
* `grep` - polecenie do wyszukiwania ciągów znaków



Następnie przetestowano obydwa skrypty, dodając przykładowy plik i tworząc commit:

**Prawidłowe wartości**

```shell
$ echo "testowa wartość 02" > test.txt
$ git add test.txt
$ git commit -m "KS404423"
```

![image-20220314212240759](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314212240759.png)



**Nieprawidłowe wartości**

```shell
$ echo "testowa wartość 03" > test.txt
$ git add test.txt
$ git commit -m "KS404423" # albo git commit -m "Nieprawidłowa_wartość"
```

![image-20220314211958441](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314211958441.png)



W dalszej kolejności zainstalowano środowisko dockerowe w WSL Ubuntu:

![image-20220314212417214](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314212417214.png)

Najpierw zaktualizowano listy paczek z repozytoriów by uzyskać najnowsze wersje wykorzystując tutorial z [oficjalnej strony](https://docs.docker.com/engine/install/ubuntu/):

```shell
$ sudo apt-get update
```

<img src="C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314212911573.png" alt="image-20220314212911573" style="zoom:60%;" />

Następnie doinstalowano szereg wymaganych dependencji:

```shell
$ sudo apt-get install \
>     ca-certificates \
>     curl \
>     gnupg \
>     lsb-release
```

<img src="C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314212936225.png" alt="image-20220314212936225" style="zoom:67%;" />

Dodano oficjalne klucze GPG Dockera:

```shell
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

![image-20220314212952883](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314212952883.png)

Ustawiono repozytorium na **stable**:

```shell
$  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

![image-20220314213009446](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314213009446.png)

I na końcu zainstalowano Docker Engine:

```shell
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

<img src="C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314213044065.png" alt="image-20220314213044065" style="zoom:100%;" />



Na końcu uruchomiono środowisko dockerowe jest uruchomione:

```shell
$ sudo service docker start
```

![image-20220314213942568](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314213942568.png)

Sprawdzono czy działa:

```shell
$ sudo service docker status
```

![image-20220314214018456](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314214018456.png)

```shell
$ ps -aux
```

![image-20220314214140757](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314214140757.png)

Następnie uruchomiono obraz `hello-world`:

```shell
$ sudo docker run hello-world
```

<img src="C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314214306353.png" alt="image-20220314214306353" style="zoom:100%;" />

Dalej pobrano i uruchomiono obraz dystrybucji linuksowej:

```shell
$ sudo docker run ubuntu
```

![image-20220314214432006](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314214432006.png)

Sprawdzono pobraną wersję obrazu Ubuntu:

```shell
$ sudo docker images
```

![image-20220314214640884](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314214640884.png)

Tag opisany jest jako `latest`, dlatego konkretnej wersji Ubuntu poszukano po uruchomieniu kontenera z obrazu:

```shell
$ sudo docker run --interactive --tty ubuntu sh
```

* `--interactive` - pozostawia STDIN (strumień wejścia) otwartym
* `--tty` - alokuje pseudoterminal 
* `sh` - pozwala na uruchomienie tego procesu w kontenerze

![image-20220314214939360](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314214939360.png)

Wartości te są takie same jak wartości WSL Ubuntu:

![image-20220314215432636](C:\Users\kale2\OneDrive\Dokumenty\MDO2022_S\INO\GCL02\KS404423\Lab01\image-20220314215432636.png)
