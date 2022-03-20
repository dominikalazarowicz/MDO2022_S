# Hooks, heterogeniczne środowisko pracy, instancja Dockera

## Zadania, który były do wykonania

>1. Przygotuj hook git, który sprawdza czy tytuł commita nazywa się MC401136 i sprawdzający czy treść commita zawiera numer Lab.
![Screen1](275820693_483718936533281_7601181912934150284_n.png)
![Screen2](275817432_305918198276660_995097057655738368_n.png)
> 2. Umieść hook w sprawozdaniu tak aby dało się go przejrzeć

```BASH
COMMIT=$1
line_commit=`head -n1 $COMMIT`
pattern_indeks="^(MC401136)"
pattern_lab=".*(Lab)[0-9][0-9]*."

until [ "$line_commit =~ $pattern_indeks" ]; do
    echo "Commit title is not correct"
    exit 1
done




while IFS= read -r line
do
    if [[ $line =~ $pattern_lab ]]; then
    exit 0
    fi
done < <(sed 1d $COMMIT)

echo "Commit message is not correct"
exit 1
```

>3. Rozpocznij przygotowanie środowiska Docerowego. Zainstaluj środowisko dockerowe w stosowanym systemie operacyjnym. 
![Screen3](275850304_1641048122954349_7771618078116000592_n.png)

>4. Wykaż, że środowisko dockerowe jest uruchomione i działa, wykaż działanie( pobierz obraz dystrybucji linuksowej i uruchom go), wyświelt numer wersji.
![Screen4](275897693_390513295809375_6462618868840290201_n.png)
> 5. Załóż konto na Docker Hub.
![Screen5](275853454_498645438480781_2875655412935737681_n.png)