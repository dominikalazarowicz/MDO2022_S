# Zajęcia 10
### 2022-05-11 -- 2022-05-13
---
# Dyrygent (orchestrator) wdrożeń automatycznych opartych o pełne systemy
## Format sprawozdania
- Wykonaj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać **odtworzenie wykonanych kroków** z wykorzystaniem opisu, poleceń i zrzutów. Oznacza to, że sprawozdanie powinno zawierać opis czynności w odpowiedzi na (także zawarte) kroki z zadania. Przeczytanie dokumentu powinno umożliwiać zapoznanie się z procesem i jego celem bez konieczności otwierania treści zadania.
- Omawiane polecenia dostępne jako clear text w treści, stosowane pliki wejściowe dołączone do sprawozdania jako oddzielne
- Sprawozdanie proszę umieścić w następującej ścieżce: ```<kierunek>/<grupa>/<inicjały><numerIndeksu>/Lab10/Sprawozdanie.md```, w formacie Markdown
- To zadanie wymaga rozwiązania kilku problemów związanych z uwierzytelnianiem i mirroringiem. Ocena zaczyna się zatem od 3.0.

## Zadania do wykonania
### Przygotowanie systemu do wdrożeń
* Zainstaluj dwie maszyny wirtualne w tej samej sieci
* Zainstaluj ansible ```dnf --assumeyes install ansible```
* Stwórz plik inwentaryzacji
* Połącz się z drugą maszyną poprzez ping

#### Zakres rozszerzony
* Skonfiguruj uwierzytelnianie askpass kluczami ssh

### Repozytoria
* Stwórz playbook
  * Doinstaluj wymagane repozytoria na maszynie docelowej
  * Przeprowadź instalację wybranego oprogramowania

#### Zakres rozszerzony
* Wyprowadź własne repozytorium (W przypadku systemd-nspawn, lokalne repozytorium instalacyjne systemu)

### nspawn
* Zainstaluj kontener systemd na maszynie docelowej przy użyciu repozytorium via Ansible
* Uruchom (lokalnie)

