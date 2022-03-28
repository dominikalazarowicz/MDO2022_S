### Anna Godek
# Sprawozdanie 2 

[1] Przygotowaniee git hooków, które rozwiążą najczęstsze problemy z commitami

W tym celu weszłam do katalogu `.git` a następnie do podkatalogu `hook`. Odnaleziono plik `commit-msg.sample`, zedytowano jego zawartość i zmieniono nazwę pliku na `comit-msg`.
![ryc1](ryc1.png)

W pierwszym hooku sprawdzane jest, czy tytułu commita nazywa się `AG401570`, jeśli tak nie jest - proces jest przerywany.
![ryc2](ryc2.png)

Sprawdzono poprawność napisanego kodu.
![ryc3](ryc3.png)

Utworzono drugi hook, sprawdzający, czy w treści commita pada numer labu właściwy dla zadania. Zedytowany został plik `pre-commit.sample` 
![Hook2-zawartosc](Hook2-zawartosc.png)
![ryc4](ryc4.png)

[3] Do instalacji dockera wykorzystano WSL w wersji 2 z Ubuntu-18.04 
![WSL2](WSL2.png)

Na początku zaktualizowano listę paczek z repozytorium, doinstalowano pakiety i dodano oficjalne klucze GPG Dockera, ustawiono repozytorium na stable 
```bash
$ sudo apt-get update

$ sudo apt-get install 

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
![update&install](update&install.png)
![curl&echo](curl&echo.png)

W kolejnym kroku zainstalowano Docker Engine.
```bash
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```
![installDockerEngine](installDockerEngine.png)

[4] Uruchomiono środowisko dockerowe i sprawdzono działanie, uruchomiono również obraz hello-world
```bash
$ sudo service docker start

$ sudo service docker status

$ sudo docker run hello-world
```
![status&start&hello](status&start&hello.png)

Pobrano obraz fedory, uruchomiono i sprawdzono pobraną wersję 
```bash
$ docker pull fedora

$  sudo docker run -it fedora

$ sudo docker images
```
![pull&run&images](pull&run&images.png)

Założono również konto na hub.docker.com
![Docker1](Docker1.png)
![Docker2](Docker2.png)
