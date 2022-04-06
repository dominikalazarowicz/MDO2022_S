SPRAWOZDANIE 4
#

1. Zachowywanie stanu:

Przygotowanie woluminu wejściowego oraz wyjściowego:

![1](https://user-images.githubusercontent.com/92218468/161969018-de98dbe3-6685-4ad5-987b-364a80a0a51f.JPG)

Podłączenie woluminów do kontenera oraz jego uruchomienie:
![2](https://user-images.githubusercontent.com/92218468/161969046-de683724-6c8c-439c-82c5-2d9379bb73a0.JPG)

Sklonowanie repozytorium na wolumin wejściowy:
![3](https://user-images.githubusercontent.com/92218468/161969076-97fc70fb-8927-4427-98ef-f0431e8c39fd.JPG)

![4](https://user-images.githubusercontent.com/92218468/161969122-3d8f1931-d1ba-47ca-a13f-d3c318839db2.JPG)

Uruchomienie buildu w kontenerze:
![6](https://user-images.githubusercontent.com/92218468/161969267-7e74336a-4840-4def-8da5-b28d251fd165.JPG)
![7](https://user-images.githubusercontent.com/92218468/161969323-65fb8b3c-135b-4117-9928-05e7802a01d9.JPG)

Zapisanie plików na woluminie wyjściowym:
![8](https://user-images.githubusercontent.com/92218468/161969430-df687f2d-14b1-44b1-b9e7-363662024055.JPG)


#
2. Eksponowanie portu:

Instalacja, uruchomienie serwera iperf oraz włączenie nasłuchiwania:
![9](https://user-images.githubusercontent.com/92218468/161969501-cc8c6e4c-6aa1-4d3d-9e9b-783d5fb00b68.JPG)

Uruchomienie kolejnego konetnera:
![10](https://user-images.githubusercontent.com/92218468/161969542-06d50634-9a81-4f9f-9289-7473d0420131.JPG)

Instalacja iperf3:
![11](https://user-images.githubusercontent.com/92218468/161969573-fcf69f69-b9c3-4b93-8e4c-7b70c90a41bf.JPG)

Połączenie się z poprzednim kontenerem (drugi kontener):
![12](https://user-images.githubusercontent.com/92218468/161969626-be1540f9-74c6-4b88-9d47-c495555e3032.JPG)

Pierwszy kontener:

![13](https://user-images.githubusercontent.com/92218468/161969669-f72473c7-08dc-4a1d-997e-d982f4bd1e2d.JPG)

Instalacja iperf3 na hoście:
![14](https://user-images.githubusercontent.com/92218468/161969730-7fa561f7-aa34-4673-9c82-7e765ef38733.JPG)

Połączenie się z kontenerem:

![16](https://user-images.githubusercontent.com/92218468/161969798-e6f0a30b-e6e4-4b7f-90e1-11482a900927.JPG)

Kontener:

![15](https://user-images.githubusercontent.com/92218468/161969774-90e39bcc-7666-4658-8abb-23e1c0aab264.JPG)


WNIOSKI:

Na podstawie uzyskanych danych można stwierdzić, że najszybszy przesył danych (11 Gbits/sec) występuje między kontenerem, a hostem. Czynnikiem gwarantującym taką prędkość jest prawdopodobnie brak występowania osób dodatkowych w połączeniu między hostem, a kontenerem. Najwolniejszy przesył wystepuje między kontenerem 1, a drugim (10.5 Gbits/sec), w tym przypadku w połączeniu między kontenerami prawdopodobnie uczestniczy jeszcze host, który zmniejsza prędkość.


#
3. Instancja Jenkins:

Utworzenie sieci:

![17](https://user-images.githubusercontent.com/92218468/161969943-7f470803-07de-4cde-a7e8-3dea3aff0f3b.JPG)

Pobranie oraz uruchomienie dind:
![18](https://user-images.githubusercontent.com/92218468/161969980-c9fa7a0a-81fb-43d7-9e3e-9de714ec5f70.JPG)

Utworzenie dockerfile'a zgodnie z manualem:
![19](https://user-images.githubusercontent.com/92218468/161969999-0aec4b20-1ef9-44ef-99a3-826fd6a11d37.JPG)

Zbudowanie nowego obrazu z dockerfile'a:
![20](https://user-images.githubusercontent.com/92218468/161970041-f2ca0ce8-415a-4dc2-bfcd-56c6a29fe4f1.JPG)
![21](https://user-images.githubusercontent.com/92218468/161970082-29dbca15-3b28-460b-acab-0d000fc4d19c.JPG)

Uruchomienie obrazu:

![22](https://user-images.githubusercontent.com/92218468/161970116-087a6e0e-6082-495b-9983-2541972aca2d.JPG)

Działające kontenery:
![23](https://user-images.githubusercontent.com/92218468/161970150-aac936db-60d2-455c-a6d1-250defba29f8.JPG)

Szukanie hasła admina:
![24](https://user-images.githubusercontent.com/92218468/161970173-904a5fd2-f767-45b9-ab23-759cd68760f0.JPG)
![25](https://user-images.githubusercontent.com/92218468/161970286-e4bb96d9-e5ae-4316-835d-6b583a1d49cc.JPG)

Ekran logowania Jenkins'a:
![26](https://user-images.githubusercontent.com/92218468/161970301-d258c4b7-f3e3-4dc9-b957-6898e7ee15fb.JPG)
![27](https://user-images.githubusercontent.com/92218468/161970348-8d61d64a-0dbb-4c9c-9f26-e43968e0b436.JPG)
![28](https://user-images.githubusercontent.com/92218468/161970361-ae49aefc-914f-439c-b18e-413c6c63d136.JPG)
![29](https://user-images.githubusercontent.com/92218468/161970371-64ffc361-f26d-494a-adf8-f79aefdc7875.JPG)
![30](https://user-images.githubusercontent.com/92218468/161970384-c953de29-a2c7-4c9d-8e31-2ded313ef1c8.JPG)
![31](https://user-images.githubusercontent.com/92218468/161970398-b7228a3f-a0f8-4961-bc87-6d48ef9f8004.JPG)
