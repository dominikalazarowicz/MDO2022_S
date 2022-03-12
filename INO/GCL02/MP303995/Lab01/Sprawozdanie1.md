# Sprawozdanie - Lab01
## Instalacja klienta Git i obsługi kluczy SSH
1. W pierwszym kroku upewniłem się, że posiadam już zainstalowanego Gita oraz obsługe kluczy ssh
![Git working](./gitStart.png)
![Ssh working](./sshStart.png)

## Klonowanie repozytorium za pomocą HTTPS
2. Następnie sklonowałem repozytorium https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S za pomocą HTTPS
![https_clone](./httpsClone.png)
   
## Protokół SSH
3. W celu wykorzystania protokołu SSH w dostępie do repozytorium, utworzyłem dwa klucze SSH. 
W tym celu wykorzystałem polecenie ssh-keygen podając również swój mail z github oraz ścieżkę zapisu i nazwę klucza.
4. Jeden klucz zabezpieczony hasłem z weryfikacją działania:
![pass_key](./passkey.png)
   
5. Jeden klucz bez hasła z weryfikacją działania: 
![nopass_key](./nopasskey.png)

6. Dodanie kluczy na Githubie:
![github_keys](./ssh-github.png)

7. Aby móc używać  używać ssh przez moje konto wykorzystałem polecenie "eval":
   ![Alt text](./eval.png)
   
## Praca z repozytorium
8. Pobrałem repozytorium przez SSH
   ![Alt text](./gitclone.png)
9. Przełączyłem się na gałąź main a następnie na gałąź swojej grupy 
   ![Alt text](./gitcheckouts.png)
10. Utworzyłem swoją gałąź zgodnie z przedstawioną w instrukcji konwencją, na którą odrazu się przełączyłem (checkout -b).  Po czym przeszedłem w odpowiednie miejsce w katalogiach i utworzyłem swó folder na sprawozdanie i pliik, które w nim umieściłem
   ![Alt text](./newbranch_dir.png)
11. Dodałem aktualny stan sprawozdania wraz ze wszystkimi zrzutami ekranu, które wykonałem, a następnie utworzyłem commita i wypchnąłem zmiany do zdalnego repozytorium.
  ![Alt text](./gitpushToOrigin.png)
12. Spróbowałem wciągnąc swoją gałąź do gałęzi grupowej. W tym celu spróbowąłem zmergowania swojego brancha z branchem grupy korzystając z polecenia git merge.
Operacja nie powiodła się, poniewaz branch grupowy jest na remote branchem typu protected co powoduję, że przy takiej operacji nastepuje odmowa bezpośredniego merga.
  ![Alt text](./mergeFail.png)
13. Dokonczyłem sprawozdanie i utworzyłem pull requesta.
  ![Alt text](./pullRequest.png)
