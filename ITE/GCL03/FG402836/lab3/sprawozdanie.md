# Sprawozdanie 3
Filip Górnicki gr III DevOps 24.03.2022
## 1. Wybór oprogramowania na zajęcia
### 1. Wybrałem repozytorium z otwartą licencją oraz narzędziem npm https://github.com/watson-developer-cloud/tone-analyzer-nodejs
### 2. Sklonowałem repozytorium, doinstalowałem potrzebne zależności i zbudowałem program:
Sklonowałem: git clone
![](o1.JPG)
</br>sudo apt install npm
</br>![](o2.JPG)
</br> Zbudowałem program: nmp install
</br>![](o3.JPG)
</br> Oraz uruchomiłem: nmp start
</br>![](o4.JPG)
</br> Aplikacja działa na localhoscie na porcie 3000
</br>![](o5.JPG)
</br> Uruchomiłem testy jednostkowe: nmp test
</br>![](o6.JPG)
## 2. Przeprowadzenie buildu w kontenerze
### 1. Uruchomiłem kontener ubuntu, który pobrałem na ostatnich zajęciach, zainstalowałem w kontenerze gita oraz sklonowałem repozytorium
![](o7.JPG)
</br>![](o8.JPG)
</br>![](o9.JPG)
</br>Zainstalowałem npm
</br>![](o10.JPG)
</br>Zbudowałem program
</br>![](o11.JPG)
</br>Uruchomiłem testy
</br>![](o12.JPG)
### 2. Stworzyłem pliki Dockerfile automatyzujące kroki powyżej
</br>Kod Dockerfile1:
</br>![](o13.JPG)
</br>![](o14.JPG)
</br>![](o15.JPG)
</br>![](o16.JPG)
</br>![](o17.JPG)
</br>Kod Dockerfile2:
</br>![](o18.JPG)
</br>![](o19.JPG)
</br>![](o20.JPG)
</br>![](o21.JPG)
</br>![](o22.JPG)
### 3. Wykaż, że kontener wdraża się i pracuje poprawnie
</br>![](o23.JPG)
</br>Zauważyć można, że kontenery wdrożyły się i uruchomiły poprawnie, ponieważ kod wyjścia (STATUS) jest równy 0.
