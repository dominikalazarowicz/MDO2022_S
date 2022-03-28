# SPRAWOZDANIE LAB02 
Patrycja Pstrąg 401409

1. Wyświetlenie zawartości katalogu hooks
![](Screenshot01.png)

2. Przygotowanie git hooka sprawdzającego czy w tytule commita znajduje się PP401409, oraz czy w treści commita znajduje się numer laboratorium.

![](Screenshot02.png)

```sh
#!/bin/bash
a=`head -n1 $1`
b=`tail -n1 $1`
i='PP401409'	
nr_l='Lab02'

if ! [[ "$a" = $i ]]; then
    echo "ERROR"
    echo "Wpisany tytul commita: " $a
    echo "Wlasciwy tytul commita to: " $i
    exit 1
fi

if ! [[ "$b" = $nr_l ]]; then
    echo "ERROR"
    echo "Wpisana tresc commita: " $b 
    echo "Wlasciwa tresc commita to: " $nr_l
    exit 1
fi

echo "Commit message OK!"
exit 0
```

Przykład działania
a) niewłaściwy tytuł commita
![](Screenshot03.png)

b) właściwy tytuł commita ale niewłaściwa treść commita
![](Screenshot04.png)

c) właściwy tytuł i treść
![](Screenshot05.png)

3. Przygotowanie środowiska Dockerowego:
`sudo dnf install docker` Instalacja dockera
`docker --version` Sprawdzenie wersji dockera
![](Screenshot06.png)
`systemctl status docker` Sprawdzenie czy docker jest uruchomiony
![](Screenshot07.png)

`ifconfig` Wyświetlenie interfejsu sieciowego w celu nawiąznia połączenia z Windowsem
![](Screenshot08.png)

4.Łączenie za pomocą ssh
a) `sudo systemctl status sshd` sprawdzenie statusu ssh
b) `sudo systemctl enable sshd`
c) `sudo systemctl start sshd` uruchomienie ssh
d) ponowne sprawdzenie statusu
![](Screenshot09.png)




