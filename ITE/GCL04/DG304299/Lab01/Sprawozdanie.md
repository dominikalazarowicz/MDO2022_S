# Sprawozdanie Lab 1

## 1. Instalacja Git, obsługi kluczy SSH
- Zainstalowano wcześniej program git oraz skonfigurowano klucze SSH.
  + sprawdzenie wersji git
  > git --version

  + sprawdzenie działania kluczy ssh poprzez próbę połączenia z github.com
  > ssh git@github.com

  ![img](screen1.png)

## 2. Sklonowanie repozytorium za pomocą HTTPS
  > git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git

  ![img](screen2.1.png)

## 3. Sklonowanie repozytorium za pomocą protokołu SSH
  > git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git

  ![img](screen3.png)

## 4. Przełącz się na gałąź main, nastepnie na gałąź grupy
> cd MDO2022_S  
> git checkout main  
> git checkout ITE-GCL04 

  ![img](screen4.png)

## 5. Utworzono gałąź o nazwie DG304299, katalog o tej samej nazwie oraz folder Lab01 wewnątrz
- utworzenie nowej gałęzi
  > git checkout -b DG304299 
  > cd ITE/GCL04    
  > mkdir DG304299    
  > mkdir Lab01    
  > cd DG304299/Lab01 

- sprawdzamy aktualny branch

  > git branch


  ![img](screen5.png)

## 6. Tworzenie sprawozdania, dodanie zrzutów ekranu, commit

  - Dodanie zmiam do stage i podgląd

    > git add .

    > git status

    ![img](screen6.png)

  - Commit

    > git commit -m "Create report"

    ![img](screen7.png)

  ## 6. Wrzucenie zmian na zdalnego brancha
 
  > git push --set-upstream origin DG304299

  ![img](screen8.png)

  ## 7. Zaktualizowanie sprawozdania


  



  

  









  