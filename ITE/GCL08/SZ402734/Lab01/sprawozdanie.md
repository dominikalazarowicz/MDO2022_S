## Szymon Mateusz Zych 402734 Lab01

### Cel zadania
Konfiguracja klucza ssh oraz git w wersji terminalowej, stworzenie brancha oraz podstawowego folderu

### Kroki zadania
1. Zainstalowanie Git
![Screenshot](instalacja_git.png)
![Screenshot](wersja_git.png)
2. Sklonowanie repozytorium poprzez HTTPS
![Screenshot](git_clone.png)
3. Utworznie klucza SSH oraz pokazanie go
![Screenshot](key.png)
4. Ustawienie kluczy jako metoda dostepu do konta github
![Screenshot](ssh.png)
5. W folderze z clone repo przelaczenie sie na galez main oraz do katalogu grupy. Utworzenie wlasnego brancha oraz stworzenie wlasnego katalogu. We wlasnym katalogu stworzenie kolejno katalogu z numerem LAB.
![Screenshot](stworzenie_galzei.png)
![Screenshot](zmiana_galezi.png)
![Screenshot](stworzenie_folder.png)
6. Dodanie do katalogu naszych zmian oraz sprawozdania
![Screenshot](push.png)
![Screenshot](push_2.png)

### Wnioski

Uzyte komendy:
	sudo apt install git - instalacja pakietu git na linuxie<br />
	git --version - sprawdzenie wersji gita oraz czy istnieje<br />
	git clone - klon repozytorium do lokalnego<br />
	git branch - sprawdzanie na jakim branchu sie znajdujemy<br />
	git checkout name - zmiana brancha, flaga -b powoduje <br />			     dodanie nowego<br />
	git add name - dodanie pliku do repozytoruum<br />
	git commit -m -stworzenie commita flaga -m pozwala nam na 			       umieszczeni ekomentarza<br />
	git push --set-upstream origin name - wyslanie zmian do 						       repozytorium<br />

