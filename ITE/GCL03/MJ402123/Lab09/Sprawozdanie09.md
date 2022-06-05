<h1>Sprawozdanie z zajęć laboratoryjnych 9 Metodyki DevOps</h1>
<strong>Mateusz Janik</strong>

<strong>grupa laboratoryjna 03</strong>

Zadania, które wykonałem:

<strong>
Przeprowadziłem instalację systemu Fedora w VM(VirtualBoxie), skonfigurowałem użytkowników używając prostego hasła, sieć, wybierałem podstawowy zbiór oprogramowania:

(przydzieliłem miejsce na dysku, wybrałem język angielski i polski układ klawiatury, następnie przeprowadziłem manualne partcjonowanie, wybrałem instalacje minimalną i stworzyłem konto roota i konto użytkownika bez uprawnień admina)
</strong>

![Image](1,1.JPG " ")

![Image](1,2.JPG " ")

![Image](1,3.JPG " ")

<strong>
Następnie przeprowadziłem instalację drugiego systemu Fedora, który będzie serwował repozytorium przez HTTP:
</strong>

![Image](1,4.JPG " ")

![Image](1,5.JPG " ")

<strong>
Następnie zainstalowałem FileZille i połączyłem się z moją wirtualną maszyną
</strong>

![Image](1,7.JPG " ")

<strong>
Po poprawnie przeprowadzonej instalacji pierwszej wirtualnej maszyny z Fedorą powstał plik zawierający informacje dla instalatora.
Dzięki temu plikowi można powtórzyć instalację bez wybierania od nowa wszystkich rzeczy.
Na zdjęciu widać jak kopiuję ten plik. Plik ma nazwę "anaconda-ks.cfg"
</strong>

![Image](1,8.JPG " ")

<strong>
Instalowanie httpd na drugiej fedorze
</strong>

![Image](1,9.JPG " ")

<strong>
Umieściłem artefakt z projektu na serwerze http
</strong>

![Image](1,10.JPG " ")

<strong>
Na pierwszej maszynie wirtualnej z fedorą zainstalowałem potrzebne pakiety np. wget
</strong>

![Image](1,12.JPG " ")

<strong>
Następnie pobrałem irssi z serwera http
</strong>

![Image](1,13.JPG " ")

<strong>
Instalacja nienadzorowana:

Zlokalizowałem plik odpowiedzi z instalacji i dodałem do niego elementy odpowiedzialne za wszystkie potrzebne dependencje
Następnie zdefiniowałem repizytoria i dodałem proces pobierania artefaktu.

</strong>

Zmiany które zrobiłem:
<blockquote>

# Use graphical install
text

....

# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

...

%packages
@^minimal-environment
wget
libgcrypt*
utf8proc*
ncurses*

....

%post
mkdir /MJ402123
wget 192.168.8.104/irssi/irssi -O /tmp/irssi
cp /tmp/irssi /MJ402123
%end
</blockquote>

<strong>
Próba instalacji mowej fedory
</strong>

<strong>
i pierwszy błąd wynikający z faktu że pierwotna maszyna z której brany był plik odpowiedzi miała inny rozmiar dysku
</strong>

![Image](1,15.JPG " ")

![Image](1,16.JPG " ")

<strong>
Po naprawieniu tego
</strong>

![Image](1,17.JPG " ")

![Image](1,18.JPG " ")

![Image](1,19.JPG " ")

<strong>
Uruchomienie irssi
</strong>

![Image](1,20.JPG " ")

