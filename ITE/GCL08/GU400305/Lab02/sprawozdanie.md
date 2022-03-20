# Sprawozdanie Laboratorium nr 2


## cel ćwieczenia:
* pierwszym krokiem było przygotowania git hooka rozwiązującego najczęstsze problemy z commitami, hooki miały sprawdzać czy tytuł commita zaczyna się od inicjałów i numer indeksu oraz czy w tresci commita.
w ścieżce /.git/hooks należało znaleźć plik commit-msg i w nim umieścić skrypt sprawdzający tytu commita

* test popwyższego zadania:

* skrypt w bashu ddo sprawdzenia tytułu:

* kolejnym krokiem było przygotowanie środowiska Dockerowego, oraz zapewnienie dostępu do wirtaulnej maszyny przez zdalny terminal, wykorzystałam przy tym klucz SSH

* Natępnie zainstalowałam dockera. wersja dockera:

* Kolejno sprawdzanie działania środowiska 
    * wykazanie że środowisko dockerowe jest uruchomione i działa, z definicji
    * działanie w sposób praktyczny
    * popbranie obrazuz  dystrybucji linuksowej i uruchomienie go
    * wyświetlenie jego numeru wersji
* spullowania obrazu Ubuntu sudo docker pull ubuntu
* Uruchomienie poprzez docker run
* sprawdzenie utworzonych obrazów poprzez sudo docker images
* sprawdzenie czy obraz jest uruchomony poprzez sudo docker ps
* wyświeltenie numeru wersji obrazu

* ostatnim krokiem było założenie konta na Docker Hub

## wnioski

* do połączenia po ssh z komputerem używałam putty a do przesyłania danych z windowsa na linuxa WINSCP
* niestety niektóre screeny są z połączenia przez putty a reszta z linuxa ponieważ w pewnym momencie cały linux mi się zepsuł, ale zdołałam go naprawić i wszystko działa
