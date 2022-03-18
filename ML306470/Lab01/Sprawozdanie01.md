1.  Zainstaluj klienta Git i obsługę kluczy SSH

W celu wykonania tego podpunktu w terminalu użyłem komend: sudo apt
install git, ssh-keygen -o, cat /home/maciek/.ssh/id\_rsa.pub po czym
dodałem wyświetlony klucz publiczny do kluczy na moim koncie GitHub.

![install git](PrintScreens/installGit.png?raw=true)

2.  Sklonuj repozytorium
    <https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S> za pomocą
    HTTPS

W celu wykonania tego polecenia użyłem komendy: git clone
<https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git>

![git clone https](PrintScreens/gitCloneHTTPS.png?raw=true)

3.  Upewnij się w kwestii dostępu do repozytorium jako uczestnik i
    sklonuj je za pomocą utworzonego klucza SSH

W celu wykonania tego polecenia użyłem komendy: git clone
git@github.com:InzynieriaOprogramowaniaAGH/MDO2022\_S.git

![git clone ssh](PrintScreens/gitCloneSSH.png?raw=true)

(już wcześniej dodałem klucz do konta GitHub)

4.  Przełącz się na gałąź *main*, a potem na gałąź swojej grupy (pilnuj
    gałęzi i katalogu!)
5.  Utwórz gałąź o nazwie "inicjały & nr indeksu" np. *KD232144*. Miej
    na uwadze, że odgałęziasz się od brancha grupy!
6.  Rozpocznij pracę na nowej gałęzi

W celu wykonania poleceń 4,5,6 użyłem komend: ls, cd MDO2022\_S, git
checkout main, git branch ML306470, git checkout ML306470, mkdir
ML306470, cd ML306470, mkdir Lab01

![tasks4to6](PrintScreens/tasks4to6.png?raw=true)

Następnie stworzyłem plik sprawozdania w folderze Lab01, w którym obecnie piszę i dodałem go do gita poleceniami: git add ., git commit -m”…”
Po czym chciałem wrzucić zmiany na GitHuba poleceniem: git push --set-upstream origin ML306470, lecz zostałem powiadomiony o braku dostępu.

![git push](PrintScreens/gitPush.png?raw=true)

Po przystąpieniu do grupy umieszczenie plików na zdalnym repozytorium powiodło się.

![git push success](PrintScreens/gitPushSuccess.png?raw=true)


7.  Wystaw Pull Request do gałęzi grupowej
8.  Zgłoś zadanie (Teams assignment - jeżeli dostępne)
