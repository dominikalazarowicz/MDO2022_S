### Daniel Kabat
### Inzynieria Obliczeniowa
### INO GCL-01

# Laboratorium 01

### Zadanie 1.
W ramach zadania pierwszego nalezalo zainstalowac klienta Git oraz obsluge kluczy SSH. Zadanie jest wykonywane na Ubuntu zatem w ramach obslugi kluczy SSH nie trzeba nic robic. Instalcja klienta Git odbywa sie przy uzyciu polecenia **sudo apt-get install git**.

![Git Install](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad1_instalacja_git.png)

### Zadanie 2.
W drugim zadaniu nalezalo sklonowac repozytorium o podanym adresie. W tym celu nalezalo uzyc polecenia **git clone adres** gdzie w miejscu adresu zanjduje sie adres podany w instrukcji.

![Git Clone](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/Zad2_klonowanie_repo.png)

### Zadanie 3.
Dla trzeciego zadania nalezalo wygenerowac dwa klucze (inne niz RSA). W tym celu posluzylo polecenie **ssh-keygen -t** po ktorym otrzymujemy informacje co dopisac by odpowiedni klucz wygenerowac. Pierwszy zostal wygenerowany klucz dsa z haslem.

![SSH Key DSA](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/Zad3_1_dsa_pwd.png)

Drugi zostal wygenerowany klucz ed25519 bez hasla.

![SSH Key ed25519](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/Zad3_1_ed25519_no_pwd.png)

Kolejno nalezalo dodac klucz ssh do klienta.

![SSH Add Key](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/Zad3_2_SSH.png)

Okazalo sie ze klucz DSA nie moze byc uzyty do GItHuba.

![SSH Key Error](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad3_2_zly_klucz.png)

W takim przypadku zostal wygenerowany klucz RSA z haslem.

![SSH Key RSA](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad3_2_rsa.png)

Kolejno zostalo przelaczony dostep do GitHuba przy uzyciu ssh.

![GitHub SSH](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad3_2_ssh.png)

Dalej repozytorium zostalo sklonowane po ssh.

![SSH Clone](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad3_3_ssh_clone.png)

Przed operacja klonowania na GitHubie byla informacja ze klucz byl nie uzyty. Po klonowaniu juz mamy ze klucz zostal uzytu.

![SSH Key GitHub Used](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad3_3_uzytySSH.png)

### Zadanie 4.

W ramach zadania czwartego nalezalo przelaczyc sie na odpowiednie galezie. Najpier na galaz main i uzyto polecenia **git checkout main**. Kolejno nalezalo sie ustawic na galezi grupowiej zatem uzyto polecenia **git checkout INO-GCL01**.

![Group Branch](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad4.png)

### Zadanie 5.

Dla zadania piatego nalezalo utworzyc wlasna galaz od galezi grupowej o odpowiedniej nazwie, zatem bedac na galezi grupowej czyli po przelaczeniu na INO-GCL01 nalezalo uzyc polecenia **git checkou -b DK290596**. Dyrektywa -b oznacza ze tworzona jest nowa galaz i nastepuje odrazu przalaczenia na nia wiec operacja konczy sie tym iz jestesmy na danej gaezi podanej w poleceniu.

![Own Branch](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad5.png)

### Zadanie6.

Z racji ze wszystkie zadania byly robione po kolei a dopeiro na koniec pisane sprawozdanie to po utworzeniu wlasnej galezi w zadniu piatym w folderze grupowym zostaly utworzone odpowiednie foldery, a w folderze doecelowym umieszczone dotychczas zrobione zrzuty. Kolejno zostaly one zakomitowane by w momencie pisania sprawozdania przeklejac sobie juz linki od zrzutow. 
Po tej operacji przeslalem sprawozdanie do repozytorium zdalnego by zobaczyc czy formatowanie dziala. Ponizej znajduje sie zrzut pokazujacy jak dodawac pliki do sledzenia przy uzyciu polecenia **git add -A**, -A jest uzywane z racji by wszystkie sie dodaly. Komitowanie odbywa sie za przy pomocy polecenia **git commit -m** a w cudzyslowie zaweirami informacje do komita. Ponizej zrzut to przedstawiajacy. 

![git push](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad6.png)

Na zakonczenie nalezalo dokonac proby dociagniecia wlasnej galezi do galezi grupowej. Dokonuje sie tego poprzez przelaczenie na galaz grupowa i wykonanie polecenia **git merge DK290596**, DK290596 z racji ze taka byla moja galaz. Operacja sie nie powowiodla bo galaz grupowa jest chroniona.

![Git Merge part_1](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad6_merge_my_branch_1.png)

![Git Merge part_2](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596/INO/GCL01/DK290596/LAB_01/zad6_merge_my_branch_2.png)
