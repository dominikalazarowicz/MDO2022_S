# Sprawozdanie 3
Filip Górnicki gr III DevOps 24.03.2022
## 1. Wybór oprogramowania na zajęcia
### 1. Wybrałem repozytorium z otwartą licencją oraz narzędziem npm https://github.com/watson-developer-cloud/tone-analyzer-nodejs
### 2. Sklonowałem repozytorium, doinstalowałem potrzebne zależności i zbudowałem program:
Sklonowałem: git clone
![](o1.jpg)
</br>sudo apt install npm
</br>![](o2.jpg)
</br> Zbudowałem program: nmp install
</br>![](o3.jpg)
</br> Oraz uruchomiłem: nmp start
</br>![](o4.jpg)
</br> Aplikacja działa na localhoscie na porcie 3000
</br>![](o5.jpg)
</br> Uruchomiłem testy jednostkowe: nmp test
</br>![](o6.jpg)
## 2. Przeprowadzenie buildu w kontenerze
### 1. Uruchomiłem kontener ubuntu, który pobrałem na ostatnich zajęciach, zainstalowałem w kontenerze gita oraz sklonowałem repozytorium
![](o7.jpg)
</br>![](o8.jpg)
</br>![](o9.jpg)
</br>Zainstalowałem npm
</br>![](o10.jpg)
</br>Zbudowałem program
</br>![](o11.jpg)
</br>Uruchomiłem testy
</br>![](o12.jpg)
### 2. Stworzyłem pliki Dockerfile automatyzujące kroki powyżej
</br>Kod Dockerfile1:
</br>![](o13.jpg)
</br>![](o14.jpg)
</br>![](o15.jpg)
</br>![](o16.jpg)
</br>![](o17.jpg)
</br>Kod Dockerfile2:
</br>![](o18.jpg)
</br>![](o19.jpg)
</br>![](o20.jpg)
</br>![](o21.jpg)
</br>![](o22.jpg)
### 3. Wykaż, że kontener wdraża się i pracuje poprawnie
</br>![](o23.jpg)
</br>Zauważyć można, że kontenery wdrożyły się i uruchomiły poprawnie, ponieważ kod wyjścia (STATUS) jest równy 0.