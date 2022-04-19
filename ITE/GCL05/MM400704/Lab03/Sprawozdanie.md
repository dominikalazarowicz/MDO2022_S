# SPRAWOZDANIE 3
## Michał Mendrek ITE

### Wybranym przeze mnie oprogramowaniem jest projekt PetClinic który oparty jest na jave, springu oraz maevenie

### 1.Wykorzystując komende `git clone` kopiujemy repozytorium (ja wykonałem to wcześniej i na potwierdzenie pokazuję komunikat że repozytorium już jest dołączone)  
![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/13.PNG)
### 2.Wykonuje budowe naszego programu poprzez wykorzystanie komendy:
  `./mvnw install -DskipTests`
  
![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/2.PNG)
### 3. Wykonuje testy które dołączone sa do repozytorium z wykorzystaniem komendy:
  `./mvnw test`
  
![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/3.PNG)
### 3. Wykonuję kroki build i test wewnątrz wybranego kontenera:
#### a) uruchomiamy kontener i podłączamy do niego TTY:

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/4.PNG)

#### b) klonujemy do niego repozytorium:

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/5.PNG)

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/6.PNG)

#### c) przechodzę do katalogu spring-petclinic za pomoca `cd spring-petclinic` i uruchamiam w nim `./mvnw install -DskipTests` którego budowa zakończona zostaje sukcesem

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/7.PNG)

#### d) uruchamiamy dodatkow ponownie testy

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/8.PNG)

### 4. Tworzymy dwa pliki Docekerfile które będa miały za zadanie zautomatyzowanie naszych działań:

#### a) pierwszy z nich będzie odpowiadał za wszystkie kroki aż do naszego builda

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/14.PNG)

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/9.PNG)

#### b) drugi kopiujący plik .jar zbudowanego projektu oraz usuchamiający testy tej aplikacji:

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/15.PNG)

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/10.PNG)

### 5. Po sukcecie testów uruchamiamy nasz kontener ze zbudowanego obrazu 

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/11.PNG)

#### Dodatkowe potwierdzenie pomyślności naszych dziłań uzyskujmy poprzez wpisanie komendy `docker psw images` dzieki której możemy zobaczyż że nasz obraz istnieje i działa poprawenie

![images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab03/12.PNG)
