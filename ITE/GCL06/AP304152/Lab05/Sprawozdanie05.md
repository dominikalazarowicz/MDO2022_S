# SPRAWOZDANIE 05

# Sprawozdanie z wykorzystania Pipeline'a

## Głównym założeniem projektu było uporządkowanie procesów Build oraz Test wykorzystująć utworzne wcześniej Dockerfile. Dodatkowo należało wykonać Deploy oraz Publish aplikacji, wykorzystywanej podczas poprzednich laboratoriów.
- Zgodnie z poprzednią instrukcją należy uruchomić Jenkinsa'a skonfigurowanego na poprzednich zajęciach. Uruchamiamy DIND oraz jenkinsa:

![image](https://user-images.githubusercontent.com/72975469/169712698-24d4a48d-555c-45dd-a2a8-7bbc58fbffbd.png)
- Po zalogowaniu należy utworzyć Pipeline'a, następnie wybrać Nowy Projekt:

![image](https://user-images.githubusercontent.com/72975469/169712727-9ecfb617-c8ed-4baf-9187-7134ea85421a.png)
- W następnej kolejności należało przejść do zakładki Pipeline gdzie w polu "Repository URL" wklejamy link do repozytorium przedmiotowego, następnie dodać "Credentials" gdzie dodajemy osobiste konto Github'owe , następnie wpisujemy naszą gałąź na której pracujemy oraz ścieżke do katalogu w którym znajduję się Jenkinsfile:

![image](https://user-images.githubusercontent.com/72975469/169712752-801a60c3-083b-4fd2-acc5-a2d50028ed81.png)
![image](https://user-images.githubusercontent.com/72975469/169712766-7ed670e0-07db-4b95-8e08-dce79315ed2e.png)
- W celu umożliwienia dostępu do artefaktów osobom niezalogowanym należy odpowiednio zmienić ustawienia:

![image](https://user-images.githubusercontent.com/72975469/169712808-d1c6db02-cfc4-4cb8-b30d-673316dbee2d.png)
## Etapy wykonywanej pracy:
- Parametry w jenkinsfile

![image](https://user-images.githubusercontent.com/72975469/169713803-b01c1a60-cea1-452e-b077-88c63f2d451d.png)
- Etap clone, którego efektem końcowym jest sklonowanie repozytorium z naszą aplikacją i umieszczenie go na woluminie wejściowym:

![image](https://user-images.githubusercontent.com/72975469/169713900-e74a396e-3c96-45f1-b001-282ae0a903e5.png)
-Etap build, którego efektem końcowym jest umieszczenie zbudowanej aplikacji na woluminie wyjściowym:

![image](https://user-images.githubusercontent.com/72975469/169714122-1b585751-d07e-45ec-8aa3-995a145d63c1.png)
- W etapie tym kolejno przechodzimy do folderu w którym znajduję się plik. Uruchamiamy kontener z zamontowanymi woluminami wejsciowym i wyjsciowym bazując na wczesniej utworzonym dockerfile'u:

![image](https://user-images.githubusercontent.com/72975469/169714174-b5b1fe00-bc30-4cb0-b869-113307bee99b.png)
- W 

![image](https://user-images.githubusercontent.com/72975469/169714213-a61f3ba5-4d1f-4b0b-a2f0-7430d7d61919.png)
- aa

![image](https://user-images.githubusercontent.com/72975469/169714223-724965d4-12c2-4718-9949-f2de8246bcca.png)
-przygotowujemy etap publish

![image](https://user-images.githubusercontent.com/72975469/169714232-212640da-6860-41d5-9d86-faeb203a6ba2.png)
- Publish

![image](https://user-images.githubusercontent.com/72975469/169714245-f3270df7-cf9c-4401-9416-e32a6f0bea96.png)









## Końcowy efekt pracy:
- Aby uruchomić pipeline'a należy wybrać parametry

![image](https://user-images.githubusercontent.com/72975469/169712840-c5810762-064c-4db9-9548-73372b336757.png)
- A po poprawnym wykonaniu się zbudowanego pipeline'a wygląda to następująco:

![image](https://user-images.githubusercontent.com/72975469/169712672-d8e97edf-8181-4b69-aef6-1436406ca5d7.png)
