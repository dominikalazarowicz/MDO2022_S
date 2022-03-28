# Sprawozdanie - lab_02
## Gerard Skomin
### 1. Wybór oprogramowania na zajęcia
* Wybranym oprogramowaniem na potrzeby zajęć jest program z repozytorium:  https://github.com/mevdschee/2048.c  
* Spełnia ono następujące wymagania:
  - dysponuje otwartą licencją
  - umieszczone jest wraz z potrzebnymi narzędziami **Makefile**
  - zawiera testy, które można uruchomić przy pomocy Makefile'a, które formułują jednoznaczny raport końcowy  
* Oprogramowanie napisane jest głównie w języku C.  
![](repo.png)
### 2. Test działania bezpośrednio na maszynie virtualnej
* Klonowanie wybranego repozytorium  
![](clone.png)  
* Build oprogramowania  
![](build.png)  
* Uruchomienie testów dołączonych do repozytorium  
![](test.png)  
* Uruchomienie programu w celu przetestowania działania  
![](game.png)  
### 3. Przeprowadzenie build'u w kontenerze  
* Wybranie wystarczającego kontenera - oprogramowanie bazuje na języku C, zatem pobrany zostaje kontener **Ubuntu**  
![](pull.png)  
* Włączenie kontenera w trybie interaktywnym  
![](it.png)  
* Doinstalowywanie **Git'a**  
![](ub_git.png)  
* Klonowanie repozytorium  
![](ub_clone.png)  
* Instalacja narzędzia **make** oraz narzędzi do kompilacji C  
![](ub_make.png)  
![](compiler.png)  
* Build oprogramowania  
![](ub_build.png)  
* Przeprowadzenie testów analogicznie do testów poza kontenerem  
![](ub_test.png)  
* Uruchomienie i test działania programu  
![](ub_game.png)  
* Program i jego funkcjonowanie zostało poprawnie uruchomione
### 3. Automatyzacja build'u przy pomocy dwóch Dockerfile'ów  
* W celu przeprowadzenia analogicznych kroków do manualnego przygotowania kontenera wyświetlona została historia użytych komend  
![](history.png)  
* Dockerfile przeprowadzający kroki do momentu build'u - użycie odpowiednich dyrektyw **DockerFile** z dokumentacji Docker'a  
  - Przygotowanie pliku  
  ![](df_build.png)  
  - Uruchomienie przy jednoczesnym nadaniu nazwy **tag1**  
  ![](df_build_2.png)  
  - Pomyślne ukończenie budowania  
  ![](df_build_3.png)  
* Dockerfile bazujący na poprzednim, wykonywujący testy oprogramowania  
  - Przygotowanie pliku  
    ![](df_test.png)  
  - Uruchomienie testów oraz pomyślne ich ukończenie  
    ![](df_test_2.png)  
* Działanie kontenera z programem  
![](done.png)
* Oprogramowanie działa poprawnie za pośrednictwem automatycznego build'owania i testowania!