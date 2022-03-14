Sprawozdanie nr 1
DevOps – Sandra Góra – Nr albumu 404037
	
Przebieg laboratorium nr 1:

Na początku zainstalowałam git :

sudo apt install git

! [zdjęcie](./zdjecie.png)

Następnie sklonowałam repozytorium :

git clon https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git

! [zdjęcie](./zdjecie.png)

wygenerowałam nowy klucz SSH za pomocą komendy:

ssh-keygen -t ed25519 -f kluczyk.id


ssh-keygen -y -f ./kluczyk.id

! [zdjęcie](./zdjecie.png)

Dzięki poniższej komendzie sklonowałam repozytorium za pomocą SSH:

git clon git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git

! [zdjęcie](./zdjecie.png)

przełączyłam się na gałąź mainprzy pomocy komendy:

git checkout main
 
! [zdjęcie](./zdjecie.png)

zmieniłam na gałąź mojej grupy INO-GCL01 :

git checkout INO-GCL01

! [zdjęcie](./zdjecie.png)

Utworzyłam gałąź :


git checkout -b SG404037

! [zdjęcie](./zdjecie.png)

Następnie utworzyłam katalog:

mkdir SG404037

! [zdjęcie](./zdjecie.png)

W katalogu utworzyłam podkatalog Lab01:

mkdir Lab01

! [275772241_924337831586963_781563273121072469_n](./275772241_924337831586963_781563273121072469_n.png)


Dodałam sprawozdanie oraz zatwierdziłam zmiany za pomocą git add .:

git_add

! [zdjęcie](./zdjecie.png)

Wysłałam zmiany do zdalnego repozytorium za pomocą git push:

git_push