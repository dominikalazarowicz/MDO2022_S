# SPRAWOZDANIE 1

### 1. Zainstalowanie dowolnego klienta git
W tym celu wykorzystano polecenie `sudo apt install git`

Utworzono także klucz SSH przy omocy polecenia `ssh-keygen`

![utworzenie klucza SSH](./ssh_klucz.png)

Utworzony w ten sposób klucz przypisano do konta GitHub

![dodanie klucza SSH do konta GitHub](./key_git.png)

---
### 2. Wykonanie operacji *git clone* 
Uruchomiono terminal i użyto polecenia `git clone "url repozytrium"`  

![wykonanie operacji "git clone"](./cloneGit.png)

---
### 3. Dokumentacja pracy
Utworzono plik *sprawozdanie.md* w którym opisano wykonane już kroki instrukcji 

![Utworzenie pliku MD](./sprawozdanie.png)

---
### 4. Nowy branch w repozytorium lokalnym
Przy pomocy polecenia `mkdir` utworzono nowy folder *NP400002* 

W folderze tym utworzono folder *Lab01* w którym umieszczono plik *sprawozdanie.md* 
oraz wykonane wcześniej zrzuty ekranu

Następnie wykonano commita przy pomocy polecenia `git commit`

![Umieszczenie pliku MD w repozytorium GitHub](./commit_in_progress.png)

Sprawdzono czy wykonany commit się udał przy pomocy polecenia `git status`

![Udany commit](./commit_udany.png)

Powyższe zrzuty ekranu dodano także do repozytorium i wykonano commita

![Wykonanie drugiego commita](./commit%232.png)

---
### 5. Wykonanie *pull request*
Wykonano *push* i utworzono branch w repozytorium odpowiadający utworzonemu wcześniej lokalnemu branchowi

W tym celu wykorzystano polecenie`git push --set-upstream origin "nazwa brancha"`

![Wykonanie pusha](./push.png)

Logowanie przeprowadzono z wykorzystaniem nowo utworzonego tokenu na GitHubie

Do brancha grupy kierunkowej wykonano *pull request* swojego utworzonego brancha

![pull request](./pullrequest.png)

Wykonany zrzut ekranu zapisano, dodano do repozytorium i zrobiono commita

---

