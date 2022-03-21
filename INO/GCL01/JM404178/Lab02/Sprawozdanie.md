# Sprawozdanie 2

1.  Aby utworzyc hook'a, ktory sprawdza czy tytul commit'a sie zgadza oraz czy posiada podana nazwe laboratorium- najpierw udajemy sie do zakladki `.git/hooks`, gdzie znajdziemy plik **commit-msg.sample**. Kolejno, aby wlaczyc tego hook'a, zmieniamy nazwe tego pliku na ta sama, lecz tym razem bez koncowki **.sample**.
SS1
Nastepnie, aby sam hook zaczal robic to, co chcemy, musimy mu napisac skrypt wlasnie w tym pliku.
SS Skryptu
Teraz, aby commit przeszedl, musi on miec tytul: `<inicjały><numer indeksu>`, a tresc commita musi miec w sobie `Lab[00-99]`
**Testy**
Poprawny commit:
SS
Niepoprawny tytul:
SS
Niepoprawna tresc:
SS
Sama tresc poprzedniego commit'u znajduje sie w pliku, ktory znajdziemy w `.git/COMMIT_EDITMSG'`
SS
2. Plik **commit-msg** znajduje sie w folderze `Lab02`.
3. 



