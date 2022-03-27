### Sprawozdanie Lab02

- Stworzenie katalogu hooks oraz plików hook.
- Użycie komendy **chmod +x pre-commit/commit-msg** aby pliki były wykonywalne.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/tworzenie_hook.png)
- pre-commit
```shell
    #!/bin/sh
    
    if git diff --cached | grep "/Lab02/"
    then
          echo "Commit in Lab02"
    else
          echo "commit not in Lab02"
          exit 1
    fi
```
- commit-msg
```shell
    #!/bin/sh
    name="IW402853"
    
    if test $(cat $1)=$name
    then
          echo "Commit was successful"
    else
          echo "Wrong commit name should be $name"
    fi
```
- Użycie hook'ów poprzez wpisanie **git config core.hooksPath ~/hooks**.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/hukimuki.png)
- Przetestowanie działania hook'ów. Próba commita w złym folderze.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/zly-folder.png)
- Poprawne działanie. Powodzenie commita.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/dobry-commit.png)
- Instalacja docker'a **sudo apt-get install docker.io**.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/instal-docker.png)
- Sprawdzenie statusu docker'a, czy jest aktywny komendą **systemctl status docker**.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/dokcer%20active.png)
- Uruchomienie helllo-world komendą **sudo docker run hello-world**.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/hello-world-docker.png)
- Sprawdzenie docker za pomocą włączonych procesów, zawierających słowo 'docker'. **ps -ax |grep "docker"**
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/c3ae1ae81be05a8375236eff35ea695731869055/INO/GCL02/IW402853/Lab02/ps%20-ax.png)
- Sprawdzenie zainstalowanej wersji Linuxa. **sudo docker run -it ubuntu**
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/855aa5f2aceb76426ce978a06dfdae610029807e/INO/GCL02/IW402853/Lab02/obraz%20linux.png)
- Założenie konta na Docker Hub.

![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/855aa5f2aceb76426ce978a06dfdae610029807e/INO/GCL02/IW402853/Lab02/konto_docker_hub.png)
