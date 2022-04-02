# Sprawozdanie 4
### 01.04.2022
---
## Zachowywanie stanu

Rozpoczynam od stworzenia dwóch woluminów `volin` oraz `volout`

![img1](./s1.png)

Wyświetlam szczegóły o woluminach znajdując potrzebna informacją do dalszej części sprawozdania

![img2](./s2.png)

Odpalam kontener wraz z zamontowanymi `volume`

![img3](./s3.png)

Po wpisaniu `ls` widzimy utworzone katalogi `vin` i `vout`

![img4](./s4.png)

Klonuję repozytorium na wolumin wejściowy `volin`

![img5](./s5.png)

Widok sklonowanego repo z wnętrza kontenera

![img6](./s6.png)

Pobieram potrzebna zależności

![img7](./s7.png)

Buduję projekt

![img8](./s8.png)

![img9](./s9.png)

Skopiowałem powstały folder `build` do katalogu `vout`

![img10](./s10.png)

Po wyłączeniu kontenera pliki z woluminu wyjściowego się zachowały

![img11](./s11.png)

## Eksponowanie portu

Na początku musiałem znaleźć odpowiedni obraz dockerowy z ipref3. Pobrałem go za pomocą `docker pull networkstatic/iperf3` a następnie uruchomiłem 

![img12](./s12.png)

Sprawdzam nasłuchujące porty 

![img13](./s13.png)

Sprawdzam IP serwera 

![img14](./s14.png)

Łączę się z serwerem z drugiego kontenera 

![img15](./s15.png)

Instaluje ipref3 na hoscie

![img16](./s16.png)

Łącze się z hosta

![img17](./s17.png)

Logi z serwera

![img18](./s18.png)

## Instancja Jenkins

Zapoznaję się z dokumentacją

![img19](./s19.png)

Tworzę nową sieć dockerową

![img20](./s20.png)

Następnie przeprowadzam instalacje postępując zgodnie z dokumentacją

![img21](./s21.png)

![img21](./s21.png)

![img22](./s22.png)

![img23](./s23.png)

![img24](./s24.png)

Pokazuję praktycznie, że instancja jest uruchomiona

![img25](./s25.png)

![img26](./s26.png)

Odczytuje hasło

![img27](./s27.png)

Instaluje zalecane wtyczki

![img28](./s28.png)

Ekran logowania

![img29](./s29.png)