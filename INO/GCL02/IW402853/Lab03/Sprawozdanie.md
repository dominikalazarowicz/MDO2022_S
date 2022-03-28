### Sprawozdanie Lab03

1. Wykonanie kroków build i test wewnątrz wybranego kontenera bazowego.

- Skopiowanie repozytorium z kodem oprogramowania, który dysponuje otwartą licencją.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/skopiowanie%20repozytorium.png)
- Przeprowadzenie buildu programu oraz zainstalowanie potrzebnych zależności.

  ***sudo apt-get install meson build-essential libglib2.0-dev libssl-dev libutf8proc-dev libtinfo-dev***
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/7mason%20build1.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/7mason%20build2.png)
- Uruchomienie testów jednostkowych.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/10meson%20test.png)
- Ściągnięcie obrazu Fedora. ***sudo docker pull fedora***
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/11docker%20pull%20fedora.png)
- Rozpoczęcie pracy na obrazie ***sudo docker run --name ir3 -it fedora***
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/12instal%20git%20dnf.png)
- Zaopatrzenie kontenera w najpotrzebniejsze biblioteki i paczki.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/13meson%20build%20install.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/15instalacja%20potrzebny%20bibliotek.png)
- Sklonowanie repozytorium.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/13git%20clone.png)
- Uruchomie builda. ***meson Build***
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/17meson%20build1.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/17meson%20build2.png)
- Uruchomienie testów. ***meson test***
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/18cd%20build%20meson%20test.png)

2. Stworzenie dwóch plików Dockerfile odpowiadających za zautomatyzowanie kroków podjętych w poprzednim zadaniu.

- Utworzenie kontenera Docker-BLDR, który przeprowadza wszystkie kroki aż do builda.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/Docker-BLDR.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/19budowa%20pierwszego%20kontenera.png)
- Utworzenie kontenera Docker-TEST, który bazuje na pierwszym i wykonuje testy.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/Docker-TEST.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/20budowa%20drugiego%20kontenera.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/21drugi%20kontener.png)

3.
- Kontener powstaje na bazie obrazu, który zawiera elementy potrzebne do uruchomienia aplikacji (biblioteki, środowisko, narzędzia). Kontener tworzy wyizolowane środowisko, w którym pracuje obraz.
- Uruchomienie nowego obrazu.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/1233c29f27f9127c97ab9d9be59f8a66c512d187/INO/GCL02/IW402853/Lab03/24%20uruchomienie%20nowego%20obrazu.png)
