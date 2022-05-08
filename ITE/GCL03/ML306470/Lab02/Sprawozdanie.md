1. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami
	- hook sprawdzający, czy tytuł commita nazywa się <inicjały><numer indeksu>
	- hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania
	
	
	Dzialanie hookow
	![hooks exec](ScreenShots/hooksExec.png?raw=true)
	
	Zawartosc commit-msg
	![commit msg](ScreenShots/commitMsg.png?raw=true)
	
2. Umieść hook w sprawozdaniu w taki sposób, aby dało się go przejrzeć

	```
	#!/bin/sh

	title=$(echo `head $1` | awk '{print $1;}')
	message=$(echo `head $1` | awk '{print $2;}')


	if ! [ $title == "ML306470" ]; then 	
		echo "Wrong title."							
		exit 1;								
	fi

	if ! [[ $message =~ .*"2".* ]]; then 	
		echo "Message doesnt contain lab number."							
		exit 1;								
	fi
	echo "Commit message OK!"
	```

3. Rozpocznij przygotowanie środowiska Dockerowego
	- zapewnij dostęp do maszyny wirtualnej przez zdalny terminal (nie "przez okienko")
	
	Status serwera ssh na maszynie wirtualnej
	![ssh status](ScreenShots/sshServerStatus.png?raw=true)
	
	Połączenie przez PowerShell
	![connecting from PowerShell](ScreenShots/connectingFromPowerShell.png?raw=true)
	
	- jeżeli nie jest stosowane VM (np. WSL, Mac, natywny linux), wykaż ten fakt dokładnie
	
	- zainstaluj środowisko dockerowe w stosowanym systemie operacyjnym
	
	Instalacja dockera za pomocą skryptu
	![connecting from PowerShell](ScreenShots/scriptGetDocker.png?raw=true)
	
4. Działanie środowiska
	- wykaż, że środowisko dockerowe jest uruchomione i działa (z definicji)
	
	Docker jest uruchomiony i działa
	![docker is running](ScreenShots/dockerIsRunning.png?raw=true)
	
	- wykaż działanie z sposób praktyczny (z własności):
		- pobierz obraz dystrybucji linuksowej i uruchom go
		
		W tym celu zostały użyte komendy: sudo docker pull ubuntu, sudo docker run ubuntu
		![run linux](ScreenShots/runLinux.png?raw=true)
		
		- wyświetl jego numer wersji
		
		W tym celu zostały użyte komendy: sudo docker run --name ubuntuContainer -it ubuntu, cat /etc/lsb-release
		![linux version](ScreenShots/linuxVersion.png?raw=true)
		

5. Załóż konto na Docker Hub
	
	Konto zostało założone
![create account](ScreenShots/accountCreated.png?raw=true)