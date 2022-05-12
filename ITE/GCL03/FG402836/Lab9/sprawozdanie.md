# Sprawozdanie Filip Górnicki lab 9
### 1. Instalacja systemu Fedora
Wybrałem język systemu:
</br>![](o2.JPG)
</br>Dodałem polską klawiaturę
</br>![](o3.JPG)
</br>Ustawiłem hostname:
</br>- dla 'zwykłego' systemu: lab9.template.agh
</br>- dla systemu z serwerem http: lab9.http.agh
</br>![](o4.JPG)
</br>Ustawiłem partycje
</br>![](o5.JPG)
</br>![](o6.JPG)
</br>Dodałem konto root'a oraz ustawiłem hasło
</br>![](o7.JPG)
</br>Wybrałem opcję oprogramowania z minimalnymi funkcjonalnościami
</br>![](o9.JPG)
</br>Rozpocząłem instalację systemu
</br>![](o8.JPG)
</br>Na obrazie służącym do hostowania plików, zainstalowałem oprogramowanie do serwera httpd przy użyciu komendy
```
sudo dnf group install "Web Server"
``` 
</br>![](o10.JPG)
</br>Uruchomiłem usługę
</br>![](o11.JPG)  
</br>![](o14.JPG)
</br>Wrzuciłem artefakt na serwer przy pomocy FileZilli oraz komend
</br>![](o13.JPG)
</br>![](o12.JPG)
</br>Pobrałem z serwera na 'zwykły' system plik przy pomocy komendy
```
scp root@192.168.0.213:/var/www/html/tone-analyzer/tone-analyzer-nodejs1.0.0.tar.gz .
```
</br>![](o15.JPG)
### 2. Instalacja nienadzorowana
</br>Po zainstalowaniu systemu, wykorzystując FileZillę, skopiowałem plik odpowiedzi z instalacji o nazwie
```
anaconda-ks.cfg
```
</br>![](o1.JPG)
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
</br>![](o17.JPG)
</br>Instalacja powiodła się  
</br>![](o18.JPG)
</br>![](o19.JPG)
</br>Paczka została pobrana z serwera
</br>![](o20.JPG)
