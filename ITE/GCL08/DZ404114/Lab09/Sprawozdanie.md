# Sprawozdanie Lab09 Damian Zyznar ITE-GCL08

<br>


**Cel labortariów:** Przygotowanie systemu pod uruchomienie, Instalacja nienadzorowana, Infrastructure as a code

Artefakt utworzony w poprzednim laboratorium został poborany z Jenkinsa.

</br>


# Przygotowanie systemu pod uruchomienie
Pierwszym krokiem było pobranie obrazu Fedory w wersji 36 beta netinstall, oraz jej zainsalowanie z następującymi parametrami:
- Utworzenie partycji

![paritions](./screenshots/paritions.png)

- Włączenie konta root'a. Ważnym elementem jest zezwolenie na łączenie się przez SSH, ponieważ w kolejnych krokach na serwer zostanie przesłany artefakt na serwer przez SSH. 

![root_account](./screenshots/root_account.png)

- Ustawienie nazwy

![name](./screenshots/name.png)

- Ustawienie środowiska instalowania. Wybrano minimalną instalację.

![name](./screenshots/enviroment.png)

Po prawidłowym zainstalowaniu się systemu sprawdzono adres IP maszyny, w celu pobrania pliku `anaconda-ks.cfg` przez SSH za pomocą programu WinScp, który będzie służył do późniejszej instalacji nienadzorowanej.

![IP](./screenshots/IP.png)

![WinScp](./screenshots/WinScp.png)


<h2>Instalacja i konfiguracja serwera</h2>

Utworzono kolejną maszynę wirtualną i przeprowadzono instalację Fedory w taki sam sposób jak poprzednio. Jedyną zmianą była zmiana nazwy na serwer.

- Instalacja httpd (usługa została zainstalowana wczesniej)

![httpd_install](./screenshots/httpd_install.png)

- Dodanie wyjątków w zaporze sieciowej i jej przeładowanie

![Firewall](./screenshots/firewall.png)

- Włączneie usługi httpd i sprawdzenie jej działania

![httpd_enable](./screenshots/httpd_enable.png)

- Sprawdzenie adresu IP maszyny i przesłanie artefaktu za pomocą programu WinScp na serwer.

![IP_serwer](./screenshots/IP_serwer.png)

![WinScp_serwer](./screenshots/WinScp_serwer.png)

- Utworzenie katalogu `/var/www/html/express` (katalog /var/www domyślnie udostępniany przez usługę httpd) i skopiowanie do niego artefaktu.

![artifact](./screenshots/artifact.png)

<h2>Pobranie artefaktu z serwera</h2>

- Instalacja pakietu wget.

![wget_install](./screenshots/wget_install.png)

- Pobranie artefaktu

![wget](./screenshots/wget.png)

- Instalacja pakietu npm (pakiet zainstalowany wcześniej)

![npm](./screenshots/npm.png)

- Instalacja programu express

![npm_install](./screenshots/npm_install.png)

# Instalacja nienadzorowana
W celu przeprowadzenia instalacji nienadzorowanej zmodyfikowano pobrany wczesniej plik `anaconda-ks.cfg` i przesłano go do repozytorium na githubie.

W pliku dokonano następujących zmian:

- Zmiana trybu instalacji z graficznej na tekstową,
- Dodanie repozytoriów Fedory,
- Dodanie instalacji pakietów wget i npm,
- Dodanie sekcji post, w której dokona się pobranie artefaktu z serwera.

<a href="./anaconda-ks.cfg">anaconda-ks.cfg</a>

Uruchomiono instalację z obrazu fedory, przy pomocy pliku z githuba.

![kickstart](./screenshots/kickstart.png)

Ważnym aspektemw w tym podpuncie jest utworzenie dysku twardego w maszynie wirtualnej takiej samej wielkości, lub większego niż rozmiar partycji podany w pliku anaconda. Jeśli warunek nie zostanie spełniony instalacja się nie powiedzie.


# Infrastructure as a code

- Zamontowanie w napędzie optycznym obrazu Fedory.

![iso](./screenshots/iso.png)

- Utworzenie katalogu `/media/iso` i zamontowanie w nim obrazu z napędu.

![iso_mount](./screenshots/iso_mount.png)

- Utworzenie katalogu roboczego `/root/fedora_iso` i skopiowanie do niego obrazu z katalogu `/media/iso`.

![fedora_iso](./screenshots/fedora_iso.png)

- Skopiowanie pliku anaconda-ks.cfg do obrazu i zmiana jego nazwy na ks.cfg

![kickstart_cp](./screenshots/kickstart_cp.png)

- Modyfikacja pliku isolinux.cfg

![isolinux_cfg.png](./screenshots/isolinux_cfg.png)

- Zainstalowanie pakietu genisoimage.

![genisoimage_install](./screenshots/genisoimage_install.png)

- Utworzenie nowego obrazu ISO. Rezultat pokazany powyżej komendy.

![genisoimage](./screenshots/genisoimage.png)

![Fedora_iso](./screenshots/Fedora_iso.png)

Następnie pobrano za pomocą WinScp wygenerowany obraz ISO, utworzono nową maszynę wirtualną i uruchomiono instalację z obrazu. Instalacja powiodła się.