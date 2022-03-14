1.

git remote set-url origin git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git" 
- zmienia połącznie na SSH.

2.

git fetch git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git MS400537:MS400537
- pobieranie brancha z repozytorium

git branch MS400537
- zmiana na innego bancha

git fetch git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git MS400537:MS400537

git tag -a MS400537_lab02 -m "Michal Sarota, lab01 gotowe, teraz lab2"
- dodanie tagu do commita

#!/bin/bash

MSG="$1"

if ! grep -qE "MS400537" "$MSG";then
    cat "$MSG"
    echo "Your commit message must have 'MS400537' in it"
    exit 1
fi

