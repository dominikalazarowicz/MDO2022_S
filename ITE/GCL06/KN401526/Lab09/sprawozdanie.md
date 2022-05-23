# Sprawozdanie Lab_9 Kacper Nosarzewski
## 1. Cel cwiczenia
Celem labolatorium bylo przygotownie wdrozen nienadzorowanych

## 2. Wykonanie cwiczenia

1. Instalacja Fedory

    * Wybranie opcji oprogramowanie z minimalnymi funkcjami
    ![img](software.PNG)

    * Ustawienie nazwy hosta na `template-lab09.agh` 
    ![img](host.PNG)

    * Skonfigurowanie roota 
    ![img](root.PNG)

    * Stworzenie uytkownika
    ![img](user.PNG)

    * Rozpoczecie instalacji
    ![img](instalacja.PNG)

    * Zalogowanie sie na stworzonego uzytkownika
    ![img](logowanie.PNG)

Instalcja usugi httpd poleceniem ` sudo dnf -y install httpd`

![img](instalacja_httpd.PNG)

![img](instalacja_httpd2.PNG)

W celu dzialanie na serverze zostaly zmienione uprawinienia firewall

![img](zapora.PNG)

Natepnie sever zostaje uruchomiony poleceniem `systemctl enable httpd --now` i wyswietlono jego statusu poleceniem `systemctl status httpd`

![img](uruchomienie_servera.PNG)

Urzywajac Filezilli artefakty zostaly umieszczone na maszynie wirtualniej a nastepnie wyslane na server `http://192.168.0.189/mongo-express`

![img](artefakty.PNG)

![img](upload_artefaktow.PNG)

Na drugiej maszynie virtualnej z servera zostaly pobrane artefakty poleceniem `wget 192.168.0.189/mongo-express/mongo-express_1.0.0.tar.xz`

![img](pobranie_danych_server.PNG)

 2. Instalacja nienadzorowana

Uzywajac Filezilli z Fedora zostal przeslany pliku z odpowiedziami `anaconda-ks.sfg`

![img](skopiowanie_anacondy.PNG)

Do pliku `anaconda-ks.sfg` zosatly wprowadzone ponizsze zmiany

```
# Use graphical install
#graphical
text

# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

%packages
@^minimal-environment
wget

%post
mkdir mongo-express
wget 192.168.0.188/mongo-express/mongo-express_1.0.0.tar.xz
%end

```


