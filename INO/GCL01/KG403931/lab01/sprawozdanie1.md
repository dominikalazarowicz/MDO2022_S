gita juz mialem ale  
    ```sudo apt install git```  
klucz i potem go podpiac w githubie  
    ```ssh-keygen -t ed25519 -C "pause1@op.pl"```  
potem poteżne klonowanie  
    ```git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git```  
    ```git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git```  
potem sobie przechodzimy przez gałązki 🌿  
    ```git checkout main```  
    ```git checkout INO-GCL01```  
potem sobie robimy wlasna galazke  
    ```git checkout -b KG403931```  
potem robimy sobie operacje rozne tam na plikach,  
    - przenosimy pliki do folderu ktorym zarzadza git  
    - dodajemy je do systemu `git add *`  
    - dodajemy sobie jakis komentarz do komita `git commit -m "wiadomosc"`  
    - wrzucamy na gore `git push`  
    - ja pozwolilem mu ustawic upstreama   
    nie robilem skrinow na biezaco, z zalozeniem ze zrobie je na koniec jak juz ogarne wszystkie problemy z tym co tam zrobilem zle, ale na sam koniec virtualbox raczyl sie wykoleic, wiec mam tylko skriny z ostatecznych poprawek, w kazdym razie udalo sie wgrac zmiany  
probujemy domergeowac nasze zmiany do brancha grupy, nie mamy do tego uprawnien wiec nie przepuszcza dalej  
    przelaczamy sie na grupe `git checkout INO-GCL01`  
    mozna dociagnac zmieny `git pull`  
    lokalnie mergeujemy `git merge KG403931`  
    probujemy wypchac `git push` <- tu dostaemy odmowe, brak uprawnien  
te aktualizacje aktualizacji mozna robic w nieskocznonosc wiec ta jest ostantia  
zapomniaelm ze markdown wymaga dwoch spacji zeby zrobic nową linię  
i tam modyfikacja żeby jednak pamiętać później o markowaniu screenów do sprawozdania 👍
