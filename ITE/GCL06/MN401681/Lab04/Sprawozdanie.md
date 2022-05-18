### Michał Nycz
### Informatyka-Techniczna
### Gr-lab 06
----
# Sprawozdanie
## Metodyki DevOps lab_nr_03
----
## Zadania do wykonania:
### Zachowywanie stanu:
- Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do kontenera bazowego, z którego rozpoczynano poprzednio pracę
![image](https://user-images.githubusercontent.com/75485199/163732189-52ee458e-9c79-415a-8aa8-43e57c8eeea1.png)
----
- Uruchom kontener, zainstaluj niezbędne wymagania wstępne (jeżeli istnieją), ale bez gita
![image](https://user-images.githubusercontent.com/75485199/163732221-e67484da-db27-41a8-9178-3f8552237aae.png)
----
- Sklonuj repozytorium na wolumin wejściowy
![image](https://user-images.githubusercontent.com/75485199/163732229-aebc2c72-d5a1-4d62-befe-7809b43d1898.png)
----
- Uruchom build w kontenerze
![image](https://user-images.githubusercontent.com/75485199/163732257-23be0021-b11f-44d9-ac2b-f0ce7f9141f4.png)
![image](https://user-images.githubusercontent.com/75485199/163732266-365ad8c7-6df3-4a0a-98ec-a9c1651e9f42.png)
----
- Zapisz powstałe/zbudowane pliki na woluminie wyjściowym
![image](https://user-images.githubusercontent.com/75485199/163732273-52113c8e-4dc3-47a0-b465-07b21ccb0f9b.png)
![image](https://user-images.githubusercontent.com/75485199/163732277-39825c49-b223-4271-ad6e-157ad3723a8b.png)
----
### Eksponowanie portu:
- Uruchom wewnątrz kontenera serwer iperf (iperf3)
![image](https://user-images.githubusercontent.com/75485199/163732327-defd92b3-b01e-42e7-9e3a-1e90398a6fba.png)
![image](https://user-images.githubusercontent.com/75485199/163732332-2997cb7d-9a00-4ff4-b642-b2bef73f8f34.png)
----
- Połącz się z nim z drugiego kontenera, zbadaj ruch
![image](https://user-images.githubusercontent.com/75485199/163732350-8cb11af8-d048-4c73-9cfc-6aa54e3b77b6.png)
----
- Połącz się spoza kontenera (z hosta i spoza hosta)
![image](https://user-images.githubusercontent.com/75485199/163732356-dc0a525c-2b2c-492c-a148-d8fb77c73cbf.png)
----
- Przedstaw przepustowość komunikacji lub problem z jej zmierzeniem (wyciągnij log z kontenera)
![image](https://user-images.githubusercontent.com/75485199/163732551-4b317f4d-d7a8-433a-8a67-4150551b610f.png)

### Instancja Jenkins:
- Zapoznaj się z dokumentacją https://www.jenkins.io/doc/book/installing/docker/
![image](https://user-images.githubusercontent.com/75485199/163732573-4cd49601-306d-4f6c-aeee-f5ed5f235ba7.png)
![image](https://user-images.githubusercontent.com/75485199/163732577-be5c9355-1a53-4af6-9275-d8c567b099b3.png)
![image](https://user-images.githubusercontent.com/75485199/163732580-52723362-a2e2-41fc-87e9-11461c130a66.png)
![image](https://user-images.githubusercontent.com/75485199/163732583-401cfa28-1ca1-4742-a884-77aba2150735.png)
![image](https://user-images.githubusercontent.com/75485199/163732587-e7f9751d-1f8b-49b5-9b6c-656dd02bd4f4.png)
![image](https://user-images.githubusercontent.com/75485199/163732590-0ef92a8b-e305-449f-9424-38b97c40ea18.png)
----
- Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND
- Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania
![image](https://user-images.githubusercontent.com/75485199/163732600-1e772e7d-3565-493c-bfe3-0cdf5c76e54c.png)
![image](https://user-images.githubusercontent.com/75485199/163732604-748f8764-ffad-4d92-94e3-c8b19569ab05.png)
![image](https://user-images.githubusercontent.com/75485199/163732648-c7c22052-35eb-427c-b73f-92248b0ab299.png)
![image](https://user-images.githubusercontent.com/75485199/163732652-b8abcda2-6088-4872-a539-5e3649f9e3b3.png)
![image](https://user-images.githubusercontent.com/75485199/163732654-c5abe96a-c8d2-4606-aed4-00c730b15f11.png)
![image](https://user-images.githubusercontent.com/75485199/163732658-dbddb152-4a55-4eb0-a4f1-f1008d8f2e3c.png)
![image](https://user-images.githubusercontent.com/75485199/163732660-a3850148-fcac-4db7-964a-a1f3fdc80049.png)
![image](https://user-images.githubusercontent.com/75485199/163732662-40fff1f1-a8c4-4152-93e3-285883fe8ba3.png)
![image](https://user-images.githubusercontent.com/75485199/163732666-2f020a3a-a040-4579-bc02-cc88a6ae2fe4.png)
![image](https://user-images.githubusercontent.com/75485199/163732669-d6e48b41-63d8-4ccb-9e61-45772d605dae.png)
![image](https://user-images.githubusercontent.com/75485199/163732676-c7021be8-63e0-4eff-91ac-8df1e9393a3b.png)
![image](https://user-images.githubusercontent.com/75485199/163732679-2c6c5c2f-8fb1-4e0c-a8db-335f1716100a.png)
![image](https://user-images.githubusercontent.com/75485199/163732681-322868ae-5555-405d-86e2-ad0561e903f2.png)



