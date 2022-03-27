Na potrzeby zadania należało wybrać repozytorium na GitHub'ie zawierające 
jakiś projekt oraz jego testy. Mój wybór padł na repo prezentowane na lekcji, IRSSI,
miałem ochotę zklonować coś z C# ale miałem trochę problemów z instalacją odpowiednich
wersji .NET'a więc zostałem przy rozwiązaniu z lekcji.

Całe zadanie wykonałem poprzez połączenie z VM przez SSH z powershella w Windowsie. 
Zadanie zacząłem standardowo od utworzenia struktury folderów.


![as always](as%20always.png)


"dockeryzacja" odbywa się na obrazie fedora:latest


![fedora](new%20ubuntu%20image.png)


Po wejściu do konteneru, 


```docker run -it fedora```


instalacja potrzebnych narzędzie pakietów i dependencji.


![packages](docker%20run%20and%20install%20packages.png)


![after packages](after%20installing%20packages.png)


Następnie klonowanie repozytorium


![repo clone](git%20clone%20irssi.png)


Po przejściu do katalogu z repo, uruchomienie komendy:


![meson build](run%20meson%20setup%20build.png)


Po udanym buildzie, przejście do katalogu build i uruchomienie testów:


![meson test](meson%20test.png)


Następnie automatyzacja powyższego procesu za pomocoą docker file.


![docker file 1](docker-bldr%20file.png)

Tworzenie nowego obrazu na podstawie utworzonego docker file.


![docker build 1](docker%20build%20bldr.png)


![docker result build 1](docker%20build%20result%201.png)


![111](images%20111.png)


Aby wykazać poprawność działania buildowania, na kontenerze bldr, 
zainstalowałem za pomocą komendy ```ninja``` zbuildowane irssi.


![install irsi](ninja%20install.png)



Działające IRSSI (odpalane poprzez komende irssi):


![irssi](irssi.png)


Następnie utworzenie docker file, który na podstawie wcześniejszego utworzy kolejny
obraz tym razem w celu przeprowadzenia testów.


![docker test file](docker%20test%20file.png)


Uruchomienie builda:


![test1](docker%20file%20test%20run.png)


Wynik testów po buildzie:


![test2](docker%20file%20test%20run%20result.png)


Obraz z testami utworzony na podstawie wcześniejszego:


![test30](docker%20images%20222.png)
