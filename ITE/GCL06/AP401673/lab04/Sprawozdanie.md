# Sprawozdanie lab04

### Zachowywanie stanu


Na początku stworzono dwa woluminy o nazwach vol-in oraz vol-out.
 
![](1.%20tworzenie%20wolumin%C3%B3w.png)

Wyświetlam szczegółowe informacje o woluminach za pomocą docker inspect .

![](2.%20sprawdzenie%20stworzenie%20volumin%C3%B3w.png)

Uruchamiam kontener wraz z zamontowaniem obu woluminów za pomocą opcji -v możemy zobaczyć foldery zamontowanych woluminów o nazwach volin oraz volout.

![](3.%20zamontowanie%20wolumin%C3%B3w.png)

W uruchomionym kontenerze dokonuję instalacji potrzebnych zależności bez gita.
 
![](4.%20instalacja%20wymaga%C5%84%20wst%C4%99pnych%20bez%20gita.png)

Następnie na moim hoście przechodzą do mountopointa woluminu i klonuję do niego repo które będzie budowane. Dodatkowo wyświetlono pobrane repo które widzimy w woluminie na hoście.

![](5.%20klonowanie%20repo%20na%20wolumin.png)

Dodatkowo wyświetlam zawartość woluminu w którym się znajduje repo w uruchomionym kontenerze.

![](6.%20wykazanie%20ze%20repo%20jest%20w%20kontenerze%20w%20woluminie.png)

Następnie kopiuje repo z wolumina do kontenera aby tam przeprowadzić builda tak jak to miało miejsce w lab03.

![](7.%20przekopiowanie%20z%20volumina%20do%20kontenera.png)

Kopiuję powstałe pliki po zbudowaniu do wolumina wyjściowego.

![](8.%20skopiowanie%20powsta%C5%82ych%20plik%C3%B3w%20do%20woluminu%20wyj%C5%9Bciowego.png)

Pokazanie skopiowanych plików w woluminie ale w hoście.

![](9.%20skopiowane%20pliki%20pokazana%20na%20woluminie%20w%20ho%C5%9Bcie.png)

### Eksponowanie portu
Pobrano obraz dockerowy z zainstalowanym serwerem ipf3.

![](10.%20pobranie%20obrazu%20z%20iperf3.png)

Następnie uruchomiono kontener z serwerem ipf3 wraz z udostępnieniem portu.

![](11.%20Uruchomienie%20kontenera%20z%20iperf3.png)

Wyświetlono adres portu oraz podłączono się do serwera z innego kontenera.

![](12.%20pod%C5%82%C4%85czenie%20kontener-kontener.png)

Następnie połączono się do serwera z hosta.

![](13.%20Po%C5%82%C4%85czenie%20si%C4%99%20z%20hosta.png)

Ostatnim połączeniem się było połączenie się z poza hosta w tym przypadku był to windows, aby się z niego podłączyć udostępniono serwer na porcie 80 i przez niego podłączono się do serwera.

![](14.%20Po%C5%82%C4%85czenie%20si%C4%99%20z%20poza%20hosta.png)

Logi z kontenera na którym był serwer. Wartości są trochę inne niż przedstawione wyżej wynika to z tego, że łączono się z serwerem pewną ilość razy, a na końcu podłączono kolejne kontener - kontener potem, host - kontener oraz poza host - kontener. Jednak można zauważyć że różnicę nie są znaczne i zachowują swój stosunek. Obserwując wyniki widzimy najlepszą przepustowość po podłączeniu hosta, trochę gorszą po podłączeniu kontenera oraz dużą gorszą (wręcz nieporównywalną) przepustowość dla połączenia spoza hosta.

![](15.%20logi%20z%20kontenera.png)

### Instancja Jenkins

Zapoznano się z dokumentacją jenkinsa i zgodnie z nią przeprowadzono jego uruchomienie w kontenerze. W dokumentacji są podane dokładne kroki jakie należy przeprowadzić dla jego uruchomienia.

Pobrano obraz docker:dind wraz z ustawieniami podanymi w dokumentacji.

![](16.%20Instalacja%20jenkinsa%20w%20dockerze.png)

Stworzono dockefila który jest podany w dokumentacji i go zbudowano.

![](17.%20Dockerb%20build%20jenkinsa.png)

Uruchomiono kontener z obrazem jenkinsa.

![](18.%20Po%20zbudowaniu%20uruchomienie.png)

Następnie w przeglądarce wszedłem na adres i port na którym jest udostępniony jenkins.

![](19.%20Odblokowanie%20jenkinsa.png)

Wypisano hasło do odblokowania jenkinsa za pomocą polecenia docker exec 

![](20.%20Wyci%C4%85gni%C4%99cie%20has%C5%82a%20do%20admina%20jenkinsa%20.png)

Odblokowano jenkinsa i uruchomiono automatyczną instalację wtyczek. 

![](21.%20Instalacja%20wtyczek.png)

W pełni działający jenkins.

![](22.%20W%20pe%C5%82ni%20uruchomiony%20jenkins.png)

Ekran logowania do jenkinsa.

![](23.%20Ekran%20logowania.png)

Dodatkowe wykazanie, że utworzono kontenery działają.

![](24.%20Wykazania%20dzia%C5%82ajace%20kontenery.png)