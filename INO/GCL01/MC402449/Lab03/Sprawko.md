# Sprawozdanie
### Maciej Cholewa

1. Wybranym programem, do wykonania labolatorium jest Hello World (napisany w **ruscie**) w wydaniu blockachain (Solana). Program posiada:
    - **testy**
    - **build system (Cargo)** 
    - **otwartą licencję**

![](gitss.png)

![](license.png)

2. Dodatkowo zawiera dokumentację

![](solana.png)

3. Sklonowałem repozytorium, zrbiłem build oraz uruchomiłem testy

         git clone https://github.com/solana-labs/example-helloworld.git
         cd example-helloworld/src/program-rust/
         cargo build
         cargo test

![](build1.png)

![](build2.png)

![](test.png)


4. Uruchomiłem **deamona dokera**, aby umożliwić pracę interaktywną

![](docker.png)

5. Znalazłem wystarczający kontener bazowy z **docker huba**, pobrałem oraz uruchomiłem go

        sudo docker pull rust
        docker run -it rust

![](rust.png)

6. W kontenerze były wszystkie konieczne zależności takie jak **git, cargo, rust**, więc nie było potrzeby na doinstalowywanie. Sklonowałem repozytorium oraz uruchomiłem builda.

         git clone https://github.com/solana-labs/example-helloworld.git
         cd example-helloworld/src/program-rust/
         cargo build


![](buildc.png)

7. Następnie uruchomiłem testy

        cargo test
    
![](testc.png)
![](testc2.png)

8. Sprawdziłem jakie komendy zostały wykonane w kontenerze

        history | tail -10
        1   git clone https://github.com/solana-labs/example-helloworld.git
        2  cd example-helloworld/src/program-rust/
        3  cargo build
        4  cargo test
        5  history | tail -10

9. Napisałem dockerfila, który na podstawie obrazu **rust** buduje obraz, w którym klonuje repozytorium oraz buduje program

                FROM rust:latest
                RUN git clone https://github.com/solana-labs/example-helloworld.git
                WORKDIR example-helloworld/src/program-rust/
                RUN cargo build

10. Następnie zbudowałem obraz z użyciem wyżej napisanego dockerfila, nazwałem go blder

                docker build -t blder:latest  . -f ./Docker-BLDR

![](dockerbuild.png)

![](dockerbuild2.png)


11.  Napisałem dockerfila, który na podstawie obrazu **blder** buduje obraz, w którym wykonuje testy


12.  Następnie zbudowałem obraz z użyciem wyżej napisanego dockerfila, nazwałem go **test**

![](dockertest.png)
![](dockertest2.png)


13.  Świadectwem tego, że napisane docker file działają poprawnie oraz tego, że kontener działa i wdraża się poprawnie jest to, że powstał obraz 

![](images.png)

Na sam koniec uruchomiłem oba kontenery

![](final.png)