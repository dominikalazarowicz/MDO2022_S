# Sprawozdanie nr 1
## DevOps – Sandra Góra – Nr albumu 404037
	
Przebieg laboratorium nr 1:

Na początku zainstalowałam git :
```
$ sudo apt install git
``` 

![Zrzut ekranu z 2022-03-14 14-23-28](git.png)

![Zrzut ekranu z 2022-03-14 14-23-15](install.png)

Następnie sklonowałam repozytorium:
```
$ git clon https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

![Zrzut ekranu z 2022-03-14 14-33-29](clone.png)

wygenerowałam nowy klucz SSH za pomocą komendy:

```
$ ssh-keygen -t ed25519 -f kluczyk.id 
```

![Screenshot from 2022-03-14 14-44-02](klucz.png)

Dzięki poniższej komendzie sklonowałam repozytorium za pomocą SSH:

```
$ git clon git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

przełączyłam się na gałąź main przy pomocy komendy:

```
$ git checkout main
 ```
 
![Screenshot from 2022-03-14 15-27-14](checkout.png)


zmieniłam na gałąź mojej grupy INO-GCL01 : 

```
$ git checkout INO-GCL01
```

Utworzyłam gałąź :

```
$ git checkout -b SG404037
```

![Screenshot from 2022-03-14 15-28-15](SG404037.png)

Następnie utworzyłam katalog:
```
$ mkdir SG404037
```
W katalogu utworzyłam podkatalog Lab01:
```
$ mkdir Lab01
```
![Screenshot from 2022-03-14 15-29-44](mkdir.png)


Dodałam sprawozdanie oraz zatwierdziłam zmiany za pomocą git add .:
```
$ git add .
```
![Screenshot from 2022-03-14 18-33-03](add.png)

Wysłałam zmiany do zdalnego repozytorium za pomocą git push:
```
$ git push
```
![Screenshot from 2022-03-14 18-33-46](push.png)