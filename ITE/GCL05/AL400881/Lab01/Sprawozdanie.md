## Sprawozdanie 1

### Wprowadzenie, Git, Gałęzie, SSH

Upewniając się, że Git jest zainstalowany i możliwa jest obsługa kluczy, przystąpiono do realizacji ćwiczenia. 
![#1](screenshots/1.jpg)

Należało sklonować repozytorium za pomocą HTTPS i utworzonego klucza SSH. Można było tego dokonać odpowiednio:
```
git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

![#5](screenshots/5.jpg)

Aby klonowanie za pomocą SSH było możliwe, to należało je poprzedzić generowaniem klucza. Zgodnie z poleceniami utworzono dwa - jeden zabezpieczony hasłem i jeden bez. W obu przypadkach użyto **ed25519**.
```shell
ssh-keygen -t ed25519 -C "moj_email@mail.com"
```
![#2](screenshots/2.jpg)

Następnie uruchomiono agenta SSH i dodano mu klucze.
```shell
eval "$(ssh-agent -s)"
```
![#3](screenshots/3.jpg)

```shell
ssh-add key_2
```
![#4](screenshots/4.jpg)
![#6](screenshots/6.png)

Poniższymi poleceniami przełączono się na branch **main** i gałąź grupy, tj. **ITE-GCL05**
```git
git checkout main
git checkout ITE_GCL05
```

Będąc w odpowiedniej gałęzi utworzono nowy katalog o nazwie składającej się z inicjałów i numeru indeksu. W nim utworzono plik ze sprawozdaniem o nazwie **Sprawozdanie** i wydzielono nowy folder do przechowywania screenshotów. 
