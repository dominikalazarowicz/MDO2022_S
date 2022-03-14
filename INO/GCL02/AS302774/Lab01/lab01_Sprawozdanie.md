
# Sprawozdanie Lab01
### Agata Socha - 8.03.2022
---
## Opisy zadanń do wykonania
1. Zainstaluj klienta Git i obsługę kluczy SSH 
    - Z uwagi na potrzebę wcześniejszego korystania z GitHuba, git zostal zainstalowany na komputerze przed labolatoriami. Instalacja została wykonana za pomocą homebrew, natomiast w celu sprawdzenia, czy faktycznie git jest poprawnie zainstalowany, wywołano komendę <git --version>, która wskazała wersję 2.33.1.

    ![image-zaad0_gitversion](./img/zad0_giversion.png)

    - Kolejnym krokiem było włączenie obsługi kluczy SSH i wygenerowaanie klucza prywatnego i publicznego. Ten krok wykonywany jest do ułatwienia sobie pracy w przyszłości, a mianowicie do zapobiegania wielokrotnego pytania o haslo, czy loginu do konta. Za pomocą <git ssh-keygen> zostały stworzone dwa klucze prywatny i publiczny. Klucz publiczny został dodany na GitHuba pod nazwą public. W tym kroku, zadnemu z kluczy nie nadano hasła, klucze były typu RSA i nazywają się keys oraz keys.pub.


2. Sklonuj repozytorium https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S za pomocą HTTPS
    - Klonowanie repozytoriumn jest potrzebne w celu dokonywania w nim własnych zmian. W celu sklonowania repozytorium za pomocą HTTPS, skopiowany został link z GitHuba zaznaczając wcześniej opcję HTTPS. Mając w schowku odpowiedni adres repozytorium wykonano komendę <git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git>

3. Upewnij się w kwestii dostępu do repozytorium jako uczestnik i sklonuj je za pomocą utworzonego klucza SSH
    - Utwórz dwa klucze SSH, inne niż RSA, w tym co najmniej jeden zabezpieczony hasłem
     - Skonfiguruj klucz SSH jako metodę dostępu do GitHuba

        - W celu skrócenia klucza i minimalnego zwiększenia bezpieczeństwa wygenerowano klucze SSH ED25519. Wygenerowanie kluczy było analogiczne do generowania kluczy RSA - wykonano komendę <ssh-keygen -t ed25519>. W tym przypadku natomiast zostały nadane hasła kluczom. Klucz publiczny został dodany do githuba i nazwany jako public - ed25519. Po wygenerowaniu kluczy, od razu zauwazany jest fakt zdecydowanie krotszego ciagu znakow przy kluczach ed25519. 
        Klucz z hasłem dodałam równiez do pęku kluczy na laptopie. 

   - Sklonuj repozytorium z wykorzystaniem protokołu SSH
         -  Chcąc analogicznie do zadania 2 skopiować repozytorium napotkamy się na problem istniejącego juz repozytorium. Aby wykonać zadanie nalezało wejść do MD02022_S komendą <cd MD02022_S>. Będąc w odpowiednium katalogu, sprawdzone jakim sposobem zostało sklonowane repozytorium - <git remote -v>.Zmienienie HTTPS na SSH wykonano komendą <git remote set-url origin git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git>. 

4. Przełącz się na gałąź ```main```, a potem na gałąź swojej grupy (pilnuj gałęzi i katalogu!)

    - W celu przełączenia się na gałąź ```main```  <git checkout main>, <cd INO>, <cd GCL01>. Przełączenie się na gałąź ```main``` umozliwiło nam odnalezienie odpowiednich katalogów. Do danych katalogów mozna juz było przejść za pomocą komend <cd katalog>.
 
5. Utwórz gałąź o nazwie "inicjały & nr indeksu" np. ```KD232144```. Miej na uwadze, że odgałęziasz się od brancha grupy!
    - Stworzono gałąź za pomocą komendy <git branch -b AS302774>. Tworzenie gałęzi nie oznacza przechodzenia na nowo utworzoną gałąź i zeby na naszą gałąź się przedostać zastosowano komendę <git checkout AS302774>. -b świadczy o odgałęzieniu się od grupy


6. Rozpocznij pracę na nowej gałęzi
   - W katalogu właściwym dla grupy utwórz nowy katalog, także o nazwie "inicjały & nr indeksu" np. ```KD232144```
   - W nim także utwórz katalog: Lab01
   - W nowym katalogu dodaj plik ze sprawozdaniem

        - W celu pracy w swoim katalogu, utworzono go za pomocą komendy <mkdir AS302774>. Komendami <cd AS302774> i następnie <mkdir Lab01> stworzono katalog dla dango labolatorium w odpowiednim katalogu. 
   
   - Dodaj zrzuty ekranu (jako inline) 
   - Wyślij zmiany do zdalnego źródła

        - Żeby wysłać zmiany do zdalnego źródła, naley najpierw śledzić odpowiednie pliki. Pliki mozna zaznaczyć do sledzenia za pomocą komendy <git add .>. Gdy git obserwuje juz dany plik czy folder, status elementów mozna sprawdzić uzywając komendy <git status>, która informuje jakie pliki są śledzone oraz czy w tych plikach wystąpiły zmiany po ostatnim przesłaniu. W celu wysłania zmian plików śledzonych do zdalnego źródła wykonujemy komendę <git commit>. Kolejnym krokiem było wysłanie sprawozdania wykonująąc polecejnie <git push --set-upstream origin AS302774>. 


   - Spróbuj wciągnąć swoją gałąź do gałęzi grupowej

    -  zeby przejsc do gałęzi main aby wciągnąć swoją gałąź do gałęzi grupowej nalezało wceśniej zatwierdzić wszystkie zmiany w śledzonych plikach. Gdy na liście oczekujących plików nie było juz nic, zmieniono gałąź na gałąź main a następnie na gałąź grupy do której ostatecznie miała być zaciągnięta moja gałąź. Zaciągnięta została moja gałąź na gałąź grupy za pomocą komend <git checkout INO-GCL02> a następnie <git merge AS302774>. Z uwagi na to iz branch grupowy jest zabezpieczony, nie mozna bezposrednio zmergowac galezi, komunikat o zabezpieczonej gaałezi wyświetla się po  pushowaniu. 

   - Zaktualizuj sprawozdanie i zrzuty o ten krok i wyślij aktualizację do zdalnego źródła (na swojej gałęzi)


7. Wystaw Pull Request do gałęzi grupowej

    - pull request wykonany na githubie 

8. Zgłoś zadanie (Teams assignment - jeżeli dostępne)




