# Sprawozdanie Lab 02

Sławomir Kotula

IT, DevOps, grupa lab 4

Data: 19.03.2022


# Przygotowanie git hook
## w katalogu .git/hooks/ dodano plik commit-msg sprawdzający poprawność tytułu i wiadomości commitów
### .git/hooks/commit-msg:
    #!/bin/bash

    title=`head -n1 $1`
    if [ "$title" != "SK403390" ]; then
        echo "Wrong title!"
        exit 1
    fi

    MSG=`tail -n1 $1`
    if ! [ "$MSG" =~ "Lab 02" ]; then
        echo "Wrong message!"
        exit 1
    fi

# Efekt działania hooka:
![Working hook](testingCommits.png)

# Serwer SSH jest zainstalowany i działa
![Working SSH service](SSHServerIsWorking.png)

# Podłączenie do serwera z konsoli Windows
![Working SSH connection](SSHConnected.png)

# Zainstalowano dockera
![Docker instalation](installDocker.png)
![Docker instalation](installDockerIo1.png)
![Docker instalation](installDockerIo2.png)

# Docker zainstalowano poprawnie
![Docker version](DockerVersion.png)

# Status serwisu docker
![Docker status](dockerStatus.png)

# Uruchomienie przykładowego programu Hello World w dockerze
![Docker Hello World](DockerHelloWorld.png)

# Pobranie i uruchomienie Ubuntu
![Run Ubuntu](runUbuntu.png)

# Założono konto na dockerhub
![Dockerhub](dockerHub.png)