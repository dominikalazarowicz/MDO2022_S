## Sprawozdanie
##### Autor: Dawid Gabryś

1. Na początku przygotowałem git hook.

- a) hook sprawdzający tytuł commita o nazwie ```<inicjały><numer indeksu>```:

Uruchomienie pliku commit-msg.sample:

![Screenshot 1](Screenshot_1.png)

Plik commit-msg (należało zmienić nazwę usuwając .sample by zadziałał):

![Screenshot 2](Screenshot_2.png)

Test działania:

![Screenshot 3](Screenshot_3.png)

- b) hook sprawdzający treść commita:

Plik pre-commit (podobnie jak w poprzednim przypadku usuwamy .sample):

![Screenshot 4](Screenshot_5.png)

Test działania:

![Screenshot 5](Screenshot_4.png)

![Screenshot 6](Screenshot_6.png)

2. Następnie rozpocząłem przygotowanie środowiska Dockerowego.

Sprawdziłem adres IP:

![Screenshot 7](Screenshot_7.png)

Następnie połączyłem się z VM za pomocą programu PuTTY:

![Screenshot 8](Screenshot_8.png)

![Screenshot 9](Screenshot_9.png)

Następnie zaktualizowałem indeks pakietów i zainstalowałem odpowiednie pakiety:

![Screenshot 10](Screenshot_10.png)

![Screenshot 11](Screenshot_11.png)

Dodałem klucz GPG Dockera:

![Screenshot 12](Screenshot_12.png)

Oraz użyłem odpowiedniego polecenia żeby skonfigurować stabilne repozytorium:

![Screenshot 13](Screenshot_13.png)

Potem ponownie zaktualizowałem pakiety i zainstalowałem ostatnią wersję Docker Engine:

![Screenshot 14](Screenshot_14.png)

Sprawdziłem wersję Dockera:

![Screenshot 15](Screenshot_16.png)

I sprawdziłem, czy środowisko jest uruchomione:

![Screenshot 16](Screenshot_17.png)

![Screenshot 17](Screenshot_18.png)

Pobrałem i zainstalowałem obraz hello-world w celu weryfikacji czy Docker Engine został pobrany prawidłowo:

![Screenshot 18](Screenshot_19.png)

![Screenshot 19](Screenshot_20.png)

Pobrałem i zainstalowałem obraz dystrybucji linuksowej (tu: ubuntu):

![Screenshot 20](Screenshot_21.png)

![Screenshot 21](Screenshot_22.png)

I uruchomiłem go oraz sprawdziłem wersję:

![Screenshot 22](Screenshot_23.png)

3. Założyłem konto na Docker Hub:

![Screenshot 23](Screenshot_25.png)