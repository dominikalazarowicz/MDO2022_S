<h1>Sprawozdanie z zajęć laboratoryjnych 2 Metodyki DevOps</h1>
<strong>Mateusz Janik</strong>

<strong>grupa laboratoryjna 03</strong>

Zadania, które wykonałem:

1 Githook, który sprawdza tytuł commita (czy nazywa się MJ402123) oraz treść commita (czy pada w niej numer labu, właściwego dla zadania)
Plik commit_msg
```
#!/bin/sh
#-------------------------------------------------------------------moje-zmiany------------------------------
title=`head -n1 $1`
message=`tail -n1 $1`
message_p="(02)"
if ! [[ "$title" = "MJ402123" ]]; then
    echo "Zly tytul"
    exit 1
fi
if ! [[ "$message" =~ $message_p ]]; then
    echo "Zla wiadomosc commita"
    exit 1
fi

```

2 Zapewniłem przygotowanie środowiska dockerowego:
Instalowanie dockera:
![Image](19_03_11_30.JPG "docker.io")

![Image](19_03_11_34.JPG "docker")

Sprawdzenie wersji dockera:
![Image](19_03_11_35.JPG "wersja dockera")

Sprawdzenie działania przez uruchomienie hello-world
![Image](19_03_11_36.JPG "hello world")

Sprawdzenie statusu ssh:
![Image](19_03_11_37.JPG "ssh status")

Połączenie z VM przez cmd:
![Image](19_03_11_42.JPG "cmd")

3 Działanie środowiska:

Sprawdzenie statusu dockera:
![Image](19_03_13_51.JPG "status docker")

Pobranie obrazu Ubuntu i uruchomienie:
![Image](19_03_14_00.JPG "ubuntu")

4 Utworzenie konta na Docker Hub:
![Image](19_03_14_16.JPG "docker hub")


