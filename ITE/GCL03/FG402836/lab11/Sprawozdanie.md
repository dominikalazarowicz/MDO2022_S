# Sprawozdanie 11
### Filip Górnicki
## 1. Klastra Kubernetes
Zainstalowałem minikube na podstawie dokumentacji:
</br>![](1.JPG)
</br>![](2.JPG)
</br>Oraz zaopatrzyłem się w polecenie kubectl
</br>![](1-1.JPG)
</br>![](2-1.JPG)
</br>Wpisaniu komendy minikube dashboard, uruchomiła się przeglądarka:
</br>![](4.JPG)
</br>Kuberenetes działa jako kontener
</br>![](5.JPG)
## 2. Analiza posiadanego kontenera
Pobrałem gotowy obraz nginx komendą
``docker pull nginx`` oraz uruchomiłem:
</br>![](6.JPG)
## 3. Uruchamianie oprogramowania
Uruchomiłem kontener na stosie
</br>![](7.JPG)
</br>![](8.JPG)
</br>![](9.JPG)
</br>Wyprowadziłem port
</br>![](11.JPG)
</br>![](10.JPG)
## 4. Utworzenie pliku wdrożenia
Utworzyłem plik wdrożeniowy:
</br>![](12.JPG)
W którym dodaje 3 repliki.
</br>Uruchamiam oprogramowanie wykorzystując plik wdrożeniowy:
</br>![](13.JPG)
</br>![](15.JPG)










