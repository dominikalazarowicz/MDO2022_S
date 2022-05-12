# Sprawozdanie Filip Górnicki lab 9
### 1. Instalacja systemu Fedora
Wybrałem język systemu:
</br>![](o2.jpg)
</br>Dodałem polską klawiaturę
</br>![](o3.jpg)
</br>Ustawiłem hostname:
</br>- dla 'zwykłego' systemu: lab9.template.agh
</br>- dla systemu z serwerem http: lab9.http.agh
</br>![](o4.jpg)
</br>Ustawiłem partycje
</br>![](o5.jpg)
</br>![](o6.jpg)
</br>Dodałem konto root'a oraz ustawiłem hasło
</br>![](o7.jpg)
</br>Wybrałem opcję oprogramowania z minimalnymi funkcjonalnościami
</br>![](o9.jpg)
</br>Rozpocząłem instalację systemu
</br>![](o8.jpg)
</br>Na obrazie służącym do hostowania plików, zainstalowałem oprogramowanie do serwera httpd przy użyciu komendy
```
sudo dnf group install "Web Server"
``` 
</br>![](o10.jpg)
</br>Uruchomiłem usługę
</br>![](o11.jpg)  
</br>![](o14.jpg)
</br>Wrzuciłem artefakt na serwer przy pomocy FileZilli oraz komend
</br>![](o13.jpg)
</br>![](o12.jpg)
</br>Pobrałem z serwera na 'zwykły' system plik przy pomocy komendy
```
scp root@192.168.0.213:/var/www/html/tone-analyzer/tone-analyzer-nodejs1.0.0.tar.gz .
```
</br>![](o15.jpg)
### 2. Instalacja nienadzorowana
</br>Po zainstalowaniu systemu, wykorzystując FileZillę, skopiowałem plik odpowiedzi z instalacji o nazwie
```
anaconda-ks.cfg
```
</br>![](o1.jpg)
</br>Zedytowałem plik:
```
# Use graphical install
text

# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64 repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

%post
mkdir tone-analyzer
scp root@192.168.0.213:/var/www/html/tone-analyzer/tone-analyzer-nodejs1.0.0.tar.gz ./tone-analyzer
%end
```
</br>Utworzyłem nową maszynę wirtualną z identycznymi parametrami jak pierwsza ('zwykła').  
</br>Na ekranie startowym wpisałem polecenie
</br>![](o17.jpg)
</br>Instalacja powiodła się  
</br>![](o18.jpg)
</br>![](o19.jpg)
</br>Paczka została pobrana z serwera
</br>![](o20.jpg)