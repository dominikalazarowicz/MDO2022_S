* Przygotuj git hook
```bash
#!/bin/bash

INPUT="$(cat $1)"

if [[ $INPUT != *"AP404122"* ]];
then
	echo "Commit name is incorrect"
	exit 1
fi

if [[ "$INPUT" != *"Lab02"* ]];
then
	echo "Lab number is incorrect"
	exit 1
fi
```
* Sprawdzenie dzialania hook'a
![Screen2](ob2.png)
* Podłączenie się do maszyny wirtualnej za pomocą OpenSSH
![Screen3](ob3.PNG)
* Docker został wcześniej zainstalowany. Pokazanie, że został poprawnie zainstalowany i działa.
![Screen4](ob4.PNG)
![Screen5](ob5.PNG)
* Pobranie obrazu Ubuntu\
![Screen6](ob6.PNG)
* Uruchomienie obrazu Ubuntu i wyświetelnie jego wersji
![Screen7](ob7.PNG)
* Założenie konta na DockerHub\
![Screen8](ob8.png)