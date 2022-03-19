# Sprawozdanie lab 2

* Przygotowanie hooka sprawdzającego czy w tytule commita znajduje się numer indeksu wraz z inicjałami oraz numer laboratorium

```bash
#!/bin/bash
STUDENT_ID="WJ400220"
LAB_NR="Lab02"
if [[ $(cat $1) != $STUDENT_ID* ]]; then
 echo "Commit musi zawierac identyfikator studenta!"
 exit 1
 else
  if [[ $(cat $1) != $LAB_NR* ]]; then
  echo "Commit musi zawierac nazwe laboratorium!"
  exit 1
  else
   exit 0
  fi
  exit 0
fi 
```