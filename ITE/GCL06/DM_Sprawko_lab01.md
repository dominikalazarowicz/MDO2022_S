#### Dominik Mrówka
#### Gr Lab 06, 10.03.2022
### DevOps- Sprawozdanie z Lab01

Realizowane kroki w trakcie laboratorium:
- Skonfigurowano maszynę wirtualną (system operacyjny Ubuntu) aby umożliwić podłączenie się do niej przez klienta ssh.
- Zweryfikowano na maszynie instalację serwera ssh
![instalacja ssh](/ITE/GCL06/1.png "instalacja ssh")
- Sprawdzono czy serwer jest aktywny
![czy serwer chodzi](/ITE/GCL06/2.png "czy serwer chodzi")
- Z konsoli powershell w windowsie zainstalowano klienta OpenSsh i połączono się do maszyny wirtualnej
![ssh windows connect](/ITE/GCL06/3.png "ssh windows connect")
- Zweryfikowano instalację git'a
![git version](/ITE/GCL06/4.png "git version")
- Utworzono parę kluczy SSH z użyciem szyfrowania ECDSA
![klucze](/ITE/GCL06/5.png "klucze")
- Skonfigurowano wygenerowany klucz jako metodę dostępu ssh
![git klucz](/ITE/GCL06/6.png "git klucz")
- Sklonowano repozytorium przy pomocy połączenia ssh
![klon repo](/ITE/GCL06/62.png "klon repo")
- Przełączono się na gałąź main, a następnie na gałąź grupy ITE-GCL06
- Stworzono nową gałąź DM401055
![nowa galaz](/ITE/GCL06/7.png "nowa galaz")
- Przełączono się na nową gałąź i stworzono w niej folder DM401055, wewnątrz którego stworzono folder Lab01
![foldery](/ITE/GCL06/8.png "foldery")
- Skopiowano przy pomocy programu Filezilla plik markdown ze sprawozdaniem
![sprawko](/ITE/GCL06/9.png "sprawko")
- Dodano zmiany do commita, zcommitowano je oraz spushowano na swoją gałąź na repozytorium
- Spróbowano zmergować zmiany z gałęzią grupy, ale zmiany nie zachowały się co wskazuje na brak uprawnień
![repo push](/ITE/GCL06/10.png "repo push")
![brak zmian](/ITE/GCL06/11.png "brak zmian")
- Wprowadzono zmiany do sprawozdania, zcommitowano i spushowano je, oraz stworzono pull request