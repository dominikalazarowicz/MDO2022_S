1.  Zainstaluj klienta Git i obsługę kluczy SSH

W celu wykonania tego podpunktu w terminalu użyłem komend: sudo apt
install git, ssh-keygen -o, cat /home/maciek/.ssh/id\_rsa.pub po czym
dodałem wyświetlony klucz publiczny do kluczy na moim koncie GitHub.

1.  Sklonuj repozytorium
    <https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S> za pomocą
    HTTPS

W celu wykonania tego polecenia użyłem komendy: git clone
<https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git>

1.  Upewnij się w kwestii dostępu do repozytorium jako uczestnik i
    sklonuj je za pomocą utworzonego klucza SSH

W celu wykonania tego polecenia użyłem komendy: git clone
git@github.com:InzynieriaOprogramowaniaAGH/MDO2022\_S.git

(już wcześniej dodałem klucz do konta GitHub)

1.  Przełącz się na gałąź *main*, a potem na gałąź swojej grupy (pilnuj
    gałęzi i katalogu!)
2.  Utwórz gałąź o nazwie "inicjały & nr indeksu" np. *KD232144*. Miej
    na uwadze, że odgałęziasz się od brancha grupy!
3.  Rozpocznij pracę na nowej gałęzi

W celu wykonania poleceń 4,5,6 użyłem komend: ls, cd MDO2022\_S, git
checkout main, git branch ML306470, git checkout ML306470, mkdir
ML306470, cd ML306470, mkdir Lab01

Następnie stworzyłem plik sprawozdania w folderze Lab01, w którym
obecnie piszę.

1.  Wystaw Pull Request do gałęzi grupowej
2.  Zgłoś zadanie (Teams assignment - jeżeli dostępne)
