# Sprawozdanie DevOps - Lab01
### Daniel Klata - ITE-GCL03

## 1. Zainstaluj klienta Git i obsługę kluczy SSH

- Utworzono maszynę wirtualną w programie VirtualBox, pobrano na niej Git przy pomocy komendy `sudo apt-get install git` oraz pobrano obsługę ssh za pomocą komendy `sudo apt-get install openssh-server`
![utworzenie maszyny witrualnej](setup_vm.jpg)
![instalacja git](install_git.jpg)
![instalacja ssh](install_ssh.jpg)

## 2. Przetestowano działanie git klonując repozytorium przy pomocy https, uzywając komendy `git clone {link_do_repo}`
![git clone https](git_clone_https.jpg)
## 3. Skonfigurowano połączenie githuba z maszyną przez SSH 
- wygenerowano klucze ssh (nie rsa):
![generowanie kluczy](generate_ssh_keys.jpg)

- upewniono się, że agent ssh działa oraz dodano prywatny klucz:
![agent ssh](ssh_agent.jpg)

- następnie skopiowano klucz publiczny i dodano go na githubie:
![ssh](pub_ssh.jpg)
![ssh](add_ssh_to_github.jpg)

## 4, 5, 6 Stworzono nową gałąź odchodzącą od gałęzi grupy `ITE-GCL03` oraz dodano do niej plik sprawozdanie.md
- Użyto komendy `git checkout ITE-GCL03` aby przełączyć się na gałąź grupową
- Następnie użyto komendy `git checkout -b DK403865`, parametr -b tworzy nową gałąź, co oznacza, że stworzyliśmy swojego lokalnego brancha
- Na lokalnym branchu utworzono odpowiednie foldery komendą `mkdir {nazwa}`, a następnie dodano plik sprawozdanie.md
- Aby wypchnąć zmiany wykonano następujące kroki:
- Dodano zmiany do commita `git add *`
- Zcommitowano lokalnie do naszego brancha `git commit -m "wiadomosc"`
- Wypchnięto zmiany na zdalne repozytorium `git push origin KD403865` 
![create and commit](create_sprawozdanie_on_own_branch_commit_then_push.jpg)

## Aby ułatwić pracę i przesłanie screenshotów do sprawozdania skonfigurowano połączenie menedżera plików WinSCP z maszyną wirtualną
![winSCP](setup_winSCP.jpg)

## Przesłano przy pomocy menedżera sprawozdanie na maszynę wirtualną wraz ze screenshotami oraz zcommitowano zmiany
![sprawko](commit_sprawozdanie.jpg)

## 7. Wystawiono pull requesta do grupowego brancha
![sprawko](pull_request.jpg)

### Po wystawieniu pull requesta dodano do niego dodatkowy przedstawiający ten właśnie krok