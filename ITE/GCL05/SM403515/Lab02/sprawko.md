# Sprawozdanie - Lab: 02

### Przejście do folderu .git/hooks

![This is an image](gitdir.png)

### Przygotowanie git hooka, który sprawdza poprawność tytułu i treści wiadomości

```
#!/usr/bin/env bash

INPUT_FILE=$1

START_LINE=`head -n1 $INPUT_FILE`

TITLE_PATTERN="^(SM403515)"

MSG_PATTERN=".*(LAB)[0-9][0-9]*."

if ! [[ "$START_LINE" =~ $TITLE_PATTERN ]]; then
  echo "Wrong commit title"
  exit 1
fi

while IFS= read -r line
do
	if [[ $line =~ $MSG_PATTERN ]]; then
		exit 0
	fi
done < <(sed 1d $INPUT_FILE)

echo "Wrong commit message"
exit 1
```

Nadanie uprawnień dla git hooka

```
chmod +x commit-msg
```

Sprawdzenie działania hooka

```
git commit -m "*tutaj różne treści w zeleżności co chcę sprawdzić*"
```

![This is an image](gitcommittest.png)

### Przygotowanie środowiska dockerowego

Wcześniej posiadałem zainstalowany Docker w swoim systemie

```
sudo systemctl status docker
```

![This is an image](dockerstatus.png)

### Pobranie i uruchomienie dockerowego obrazu w trybie interaktywnym

```
docker pull alpine
```

![This is an image](dockerpull.png)

```
docker run -it alpine
```

![This is an image](dockerrun.png)

W kontenerze Alpine'a

```
cat /etc/os-release
```

![This is an image](alpineversion.png)

### Założenie konta na Docker Hub

![This is an image](dockerhub.png)
