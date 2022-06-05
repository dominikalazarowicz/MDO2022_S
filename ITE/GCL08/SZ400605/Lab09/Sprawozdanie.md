# Szymon Piotr Zych 400605 Sprawozdanie_Lab04

## Sprawozdanie przesłane zostaje z opóźnieniem spowodowanym faktem, że jedynym urządzeniem do którego mam dostęp to Mac na którym jest problem z VirtualBoxem. Dopiero dzisiaj udało mi się skorzystać z urządzenia na którym mogłem swobodnie wykonac laboratorium nr 9.

# Przygotowanie systemu

Instalacja systemu Fedora:

- włączamy konto roota oraz zaznaczamy checkbox, aby możliwe było logowanie po SSH, ponieważ będziemy później korzystali z tej opcji.

![root_ssh](./install1.JPG)

- wybieramy minimalną instalację

![min_install](./min_install.JPG)

- nadajemy nazwę naszemu komputerowi

![install_name](./install_name.JPG)

- Zaznczamy niestandardowa, aby utworzyć partycje

![custom](./custom_install.JPG)

Po kliknięciu gotowe wyświetli nam się kolejne okno dialogowe, tam wybieramy "Kliknij tutaj, aby utworzyć utworzyć automatycznie". Po kliknięciu dostajemy gotowe partycje.

![partition1](./partition1.JPG)

Następnie widzimy podsumowanie zmian które zleciliśmy.

![partition2](./partition2.JPG)

Po tych krokach konfiguracyjych możemy przejść do faktycznej instalacji.

![installation](./installation_in_progress.JPG)

Po prawidłowo zakończnonej instalacji uruchamiamy ponownie i bootujemy z dysku twardego. Nastepnie sprawdzamy ip hosta. Aby nasz host otrzymał ip z odpowiednej puli adresów w ustawieniach maszyny wirtualnej w zakładce sieć może być konieczne ustawienie karty sieciowej na mostkowaną(bridged)

![host_ip](./host_ip.JPG)

Do pobrania pliku konfiguracyjnego użyłem programu WinSCP.

![host_wscp](./host_wscp.JPG)

Instalacja serwera przebiegła dokładnie takim samym tokiem, jedyna zmiana to nadanie nazwy komputera server.

Po zainstalowaniu serwera mogliśmy przejść do instalacji i konfiguracji Serweera HTTP Apache(HTTPD). Aby zainstalować Apache korzystamy z polecenia

```
dnf install httpd
```

![httpd_install](./httpd_install.JPG)

![httpd_install2](./httpd_install2.JPG)

Nastpępnie musimy uruchomić usługę, ponieważ jest ona domyślnie wyłączona i niaktywna.
Posłużymy się więc poleceniem

```
systemctl enable httpd --now
```

![httpd_enable](./httpd_enable.JPG)

Sprawdzamy czy Apache działa bez błędów:

![httpd_status](./httpd_status.JPG)

Apache nie dodaje automatycznie reguł zapory dla standardowych portów 80 lub 443. Dlatego przed korzystaniem z httpd musimy skonfigurować reguły zapory. Otwieramy porty, a następnie przeładowujemy zaporę, aby wprowadzić zmiany.

![httpd_firewall](./httpd_firewall.JPG)

Po krokach konfiguracyjnych sprawdzamy adres ip serwera, abyśmy mogli przesłać na niego artefakt.

![server_ip](./server_ip.JPG)

Z wykorzystaniem WinSCP tym razem przesyłamy artefakt na nasz server

![server_wscp](./serwer_wscp.JPG)

Przenosimy nasz artefakt do domyślnie udostępnianego przez httpd katalogu.

![html](./html_dir.JPG)

Teraz możemy przenieść się na hosta i pobrać artefakt z serwera. Aby było to możliwe musimy zainstalować wget i z jego wykorzystaniem pobrać artefakt.

![wget](./wget.JPG)

![wget_from_serv](./wget_from_serv.JPG)

Do rozpakowania archiwum będącego artefaktem musimy zainstalować tar.

![tar](./tar_install.JPG)

![after_tar](./afterTar.JPG)

Następnie po zainstalowaniu npm oraz dependecji możemy pokazać działanie, niestety ja wybrałem apliakcję desktopową dlatego pomijam zrzut ekranu.

# Instalacja nienadzorowana

Do przeprowadzenia instalacji nienadzorowanej nalezało odpowiednio zmodyfikować plik konfiguracyjny, który następnie dodany został na repozytorium. Dodano elementy odpowiedzialne za potrzebne dependecje, zdefiniowano repozytoria, dodano sekcję w której pobiera się artefakt z repozytorium.

Instalacja za pomocą komendy sięgającej do pliku z githuba.

![fedora_git](./fedora_git.JPG)

# Infrastructure as a code

![opt](./opt.JPG)

Utworzenie katalogu i mount do niego obraxu z napędu

![mount](./mount.JPG)

Utworzenie pomocniczengo katalogu, poniewaz montowanie było tylko do odczytu,a będziemy chcieli wprowadzić zmiany.

![tmp](./copy_to_temp.JPG)

Sprawdzamy czy plik konfiguracyjny ze zmienioną nazwą znajduje się w odpowiednim katalogu.

![ks](./ls.JPG)

Modyfikacja pliku isolinux.cfg

![isolinux](./cfg_change.JPG)

Instalacja pakietu genisoimage

![genisoimage](./geniso.JPG)

Utworzenie nowego obrazu ISO

![iso1](./generate_iso.JPG)

![iso2](./final_iso.JPG)
