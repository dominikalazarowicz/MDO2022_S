# SPRAWOZDANIE LAB02 
Patrycja Pstrąg 401409

0. Wyświetlenie zawartości katalogu hooks
![](Screenshot01.png)

1. Przygotowanie git hooka sprawdzającego czy w tytule commita znajduje się PP401409, oraz czy w treści commita znajduje się numer laboratorium.

![](Screenshot02.png)

```sh
#!/bin/bash
a=`head -n1 $1`
b=`tail -n1 $1`
i='PP401409'	
nr_l='Lab02'

if ! [[ "$a" = $i ]]; then
    echo "BLAD TYTULU COMMITA"
    echo "Wpisany tytul commita: " $a
    echo "Wlasciwy tytul commita musi zawierac: " $i
    exit 1
fi

if ! [[ "$b" = $nr_l ]]; then
    echo "BLAD TRESCI COMMITA"
    echo "Wpisana tresc commita:" $b 
    echo "Wlasciwa tresc commita musi zawierac: " $nr_l
    exit 1
fi

echo "Commit zaakceptowany"
```

3. Przykład działania
a) niewłaściwy tytuł commita
![](Screenshot03.png)

b) właściwy tytuł commita ale niewłaściwa treść commita
![](Screenshot04.png)

c) właściwy tytuł i treść
![](Screenshot05.png)
