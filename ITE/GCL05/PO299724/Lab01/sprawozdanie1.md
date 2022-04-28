##### Na początku zainstalowano GIT
Sklonowano repozytorium za pomocą HTTPS
git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
![](2.png)
##### Utworzono klucze SSH - jeden chroniony hasłem a drugi nie, dodano je na GitHUB
ssh-keygen -t ed25519 -C "piotruplay@gmail.com"
![](3_1.png)![](3_2.png)


##### utworzenie gałąź poiadającą  mmoje inicjały i numer indeksu oraz zawierającą odpowiednią treść
git checkout -b PO299724
![](5.png)

#####Stworzenie pliku sprawozdanie1.md:
cat>sprawozdanie1.md
#####/fix - przenieesiono PO299724 wodpowiednie miejsce i zmergowano
![](6.png)