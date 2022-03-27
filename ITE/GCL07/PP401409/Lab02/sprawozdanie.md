# SPRAWOZDANIE LAB02 
Patrycja Pstrąg 401409

0. Wyświetlenie zawartości katalogu hooks
![](Screenshot01.png)

1. Przygotowanie git hooka sprawdzającego czy w tytule commita znajduje się PP401409, oraz czy w treści commita znajduje się numer laboratorium.

![](Screenshot02png)

```sh
#!/bin/sh
if [ "$(grep -E -w -o 'PP401409| wc -l)" != "1" ]
then
	echo Commit musi zawierac PP401409
	return 1
fi
if [ "$(grep -E -w -o 'Lab02' "$1" | wc -l)" != "1" ]
then
        echo Commit musi zawierac numer laboratorium Lab02
	return 1
fi
return 0
```

3. Przykład działania
a) 
