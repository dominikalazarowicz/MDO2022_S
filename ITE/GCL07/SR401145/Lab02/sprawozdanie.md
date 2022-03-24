# Sprawozdanie Lab01
# Szymon Rewilak

## Przebieg ćwiczenia
1. Edytowano plik commit-msg znajdujący się w folderze .git/hooks
Napisano skrypt, który sprawdza poprawność notatki dodawanej w commicie.
Aby można było wykonać commita, należy użyć poprawnej nazwy commita (SR401145) oraz poprawny numer laboratorium (LabN)

```
#!/bin/bash
index="SR401145"
lab=".*Lab[0-9]+.*"
title='head -n1 $1'

if ! [[ $(head -n1 $1 | cut -c1-8)  == "$index" ]]; then
	echo "Error - wrong ID"
	exit 1;
fi
if ! grep -E -w -o "$lab" "$1" ; then
	echo "Error - wrong lab number!"
	exit 1
fi

echo "Commit approved!"
exit 0;
```

![](screen/git-hook.png)

2. Przetestowano poprawne działanie hooka:


