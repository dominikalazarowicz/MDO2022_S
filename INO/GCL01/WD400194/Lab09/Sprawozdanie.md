# Sprawozdanie Lab09
## Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS
---
### Przygotowanie systemu pod uruchomienie

Najpierw przystąpiłam do przygotowania maszyny wirtualnej wraz z pobranym przeze mnie wcześniej plikiem instalacyjnym Fedory (.iso) (z powodu zapomnienia zrobienia screena wstawiam screena ustawień)
![1](./1.png)

Następnie uruchomiłam instalację systemu Fedora. Pozostawiłam język jako domyślny - polski.
![2](./2.png)

Skonfigurowałam konto roota oraz użytkownika.
![5](./5.png)
![3](./3.png)
![4](./4.png)

W kolejnym kroku wybrałam instalację minimalną oraz skonfigurowałam miejsce docelowe instalacji.
![6](./6.png)
![7](./7.png)
![8](./8.png)

Instalacja przebiegła pomyślnie.
![9](./9.png)
![10](./10.png)

Po instalacji systemu Fedora zalogowałam się jako root, w celu dostania się do pliku odpowiedzi `anaconda-ks.cfg`.
![11](./11.png)

Następnie skonfigurowałam połączenie za pomocą SSH. Zaczęłam od użycia polecenia `dnf install -y openssh-server`.
![13](./13.png)

W VirtualBox ustawiłam przekierowanie portu.
![14](./14.png)
![15](./15.png)

W kolejnym kroku przeszłam do instalacji drugiego systemu Fedora (serwer http). Aby spełniała swoją funkcję skonfigurowałam ją odpowiednio, za pomocą kilku poleceń znalezionych w internecie.
`dnf install httpd`
`dnf group install "Web Server"`
`systemctl start httpd`
`systemctl enable httpd`
`firewall-cmd --add-service=http --add-service=https --permanent`
`firewall-cmd --reload`

![16](./16.png)
![17](./17.png)
![18](./18.png)
![19](./19.png)
![20](./20.png)

Następnie wzięłam mój artefakt z pipelinu i umieściłam w katalogu `html`
![20a](./20a.png)

W celu potwierdzenia działania serwera hostującego:
![21](./21.png)

### Instalacja nienadzorowana

W tym kroku za pomocą FileZilli przeniosłam plik `anaconda-ks.cfg` na swój system Windows, w celu edycji tak jak poniżej:
![22](./22.png)

Następnie plik ten wrzuciłam na Githuba.
![23](./23.png)

Ścieżka do tego pliku wygląda następująco:
`https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/WD400194/INO/GCL01/WD400194/Lab09/anaconda-ks.cfg`

Moim kolejnym krokiem była instalacja Fedory, przy użyciu wyżej wspomnianej ścieżki.
![25](./25.png)

Instalacja przebiegła pomyślnie.
![26](./26.png)

W rezultacie otrzymałam folder z pobranym wcześniej artefaktem w zainstalowanym systemie:
![27](./27.png)
