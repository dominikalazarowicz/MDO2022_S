# Sprawozdanie Lab09
## Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS


### 1. Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników (użyj haseł, które można bezkarnie umieścić na GitHubie!), sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI
- Instalacja systemu Fedora na VM, utworzenie nowej maszyny wirtualnej przydzielenie 30gb dynamicznej pamieci. Ustawienie pliku .iso, z ktorego startuje obraz.
![]()
- Wybranie języka, ja wybrałam angielski.
![]()
- Wybór dysku na którym zostanie zainstalowane srodowisko, ustawienie hasła roota.
![]()
- Ustawienia sieci.
![]()
- Wybranie opcji zainstalowania minimalnego środowiska, obsługujacego podstawowe funkcje.
![]()
- Poprawny przebieg instalacji.
![]()

### 2. Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP
- Naszym artefaktem jest plik tar, więc potrzebujemy drugiej maszyny z tym samy systemem fedora, pełniacą rolę serwera. Dokonujemy ponownej instalacji na 
VM analogicznie do pierwszej.

### 3. Umieść artefakty z projektu na serwerze HTTP
- Zlokalizowanie artefaktu na voluminie w kontenerze jenkinsa. Wydobycie, skopiowanie go poza kontener przy uzyciu komendy
  sudo docker cp 'kontener':'sciezka do pliku na voluminie' 'miejsce docelowe'.
- Wyciągniety artefakt umieszczamy na serwerze http do utworzonego folderu var/www/html/artefaktLab09.
![]()
-
![]()
-
![]()

### 4. Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu, zapisz polecenia
