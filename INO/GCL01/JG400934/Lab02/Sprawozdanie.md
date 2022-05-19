Zadanie rozpocząłem od konfiguracji połączenia SSH na maszynie wirtualnej.
Potrzebowałem doinstalować jeden pakiet oraz zforwardować port 22.
![install ssh](./apt%20get%20install%20openssh-server.png)
![port forward](./port%20forwarding.png)
![connect](./connecting%20using%20ssh.png)

Utworzenie katalogów oraz pliku sprawozdania.
![create lab2](./created%20Lab02.png)
![create sprawodanie](./created%20sprawozdanie.md%20file.png)

Zadanie utworzenie hooka:
hook odpowiedzialny za sprawdzanie wiadomości commita to hook **commit-msg**
Hook taki odpala się automatycznie przy próbie wykonania git commit, przyjmując 
jako argument wiadomość commita.
![commit-msg](./commit-msg%20content.png)
Hook odczytuje zawartość pliku z treścią commita.
Sprawdza czy w tytule (1 linijce) znajduje się <iniicjał><numer indeksu>,
oraz sprawdza w reszcie treści commita czy znajduje się tam lab<numer labu>.
Jeśli któreś z wyżej wymienionych nie jest spełnione, commit zostanie przerwany.

Pare przykładów:

Zły tytuł
![hook](./hook%20test%20-%20wrong%20title.png)
![hook](./hook%20test%20-%20wrong%20title%20-%20result.png)

Zła treść
![hook](./hook%20test%20-%20wrong%20content.png)
![hook](./hook%20test%20-%20wrong%20content%20-%20result.png)

Dobry commit
![hook](./hook%20test%20working.png)
![hook](./hook%20test%20working%20-%20result.png)


Instalacja dockera:

![docker yes](./docker%20-%20yes%20yes.png)

Ponieważ distro Linuxa na VM to Ubuntu, zdecydowałem się na distro Fedora
jako obraz do konteneryzacji.

![fedora web](./docker%20pull%20fedora%20-%20website.png)

Pobranie obrazu:
![fedora pull](./docker%20pull%20fedora.png)

Pobrany obraz:
![docker images](./docker%20images%20-%20see%20fedora.png)

Uruchomienie konteneru z Fedora:
![docke run](./docker%20run%20fedora.png)
Niestety przez brak aktywności w kontenerze jest on automatycznie zamykany.
Ostatnio działający kontener:
![docker ps -l](./docker%20ps%20-l.png)
Uruchomienie tego samego jeszcze raz tym razem z parametrami zapobiegającymi 
automatyczne zamknięcie zaraz po uruchomieniu:
![jazda](./docker%20run%20-t%20-d%20fedora.png)

Wejście do konteneru oraz pokazanie wersji Linuxa działającej w kontenerze:
![docker exec](./docker%20is%20running%20and%20we%20can%20get%20into%20one%20of%20containers.png)

Konta na DockerHub nie zakładałem jeszcze bo nie było potrzeby tego robić do 
ukończenia tego zadania.