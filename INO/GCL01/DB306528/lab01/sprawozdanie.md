Instalacja git przebiegła poprzez komendę: 
*_sudo apt install git_*
![instalacja](01 instalacja.png)

Sklonowałem repozytorium poprzez komendę: 
*_git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git_*
![repozytorium HTTPS](02 repozytorium HTTPS.png)

generowałem klucz poleceniem: 
*ssh-keygen -t ed25519 -f klucz.id*
a następnie sprawdziłem jego poprawność używając komend:
**cat klucz.id.pub
ssh-keygen -y -f ./klucz.id**
![klucz SSH](03 klucz SSH.png)

generowałem drugi klucz poleceniem:
*ssh-keygen -t ecdsa -f klucz2.id -C 'daniel.bednarski@o2.pl'*
i analogicznie do poprzedniego sprawdziłem jego poprawność.
![zabezpieczony SSH](04 zabezpieczony SSH.png)

Klucz publiczny dodałem do swojego konta na Github.
Klucz prywatny dodałem do ssh-agent:
![agent](05 agent.png)
![sprawdzony klucz](06 sprawdzony klucz SSH.png)

Sklonowałem repozytorium przy pomocy ssh poprzz komendę:
*git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git*
![git clone git](07 git clone git.png)

Następnie przejście do gałęzi INO_GCL01 i stworzenie gałęzi o nazwie "inicjały & numer indeksu":
**git checkout main
git checkout INO_GCL01
git checkout -b DB306528**
![git checkout](08 git checkout.png)

Na branchu utworzylem folder DB306528, w nim folder lab01, a następnie stworzyłem w nim plik "sprawozdanie.md"
![mkdir](09 mkdir.png)