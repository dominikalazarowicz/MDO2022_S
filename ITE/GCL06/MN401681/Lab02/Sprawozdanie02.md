### Michał Nycz
### Informatyka-Techniczna
### Gr_lab 06


----
#Sprawozdanie
## Metodyki DevOps lab.nr.2

> #### 1. Przygotuj git hook, który rozwiąże najczęstsze problemuy z commitami.
> * hook sprawdzający, czy tytuł commita nazywa się <inicjał numer indeksu>
> * hook sprawdzajacy, czy w treści commita pada numer laby, właściwy dla zadania

----

Na początek przygotowano sobie folder oraz plik do sprawozdania w odpowiednim miejscu:

----
skopiowano odpowiedni plik i rozszerzono jego skrypt tak, aby sprawdzał czy wamagania podane powyżej będą spełaniane.
Nadano mu również odpowiednie uprawnienia.

----
> #### 2. Umieść hook w sprawozdaniu w taki sposób, aby dało sięgo przejrzeć.
```
INPUT_FILE=$1
START=`head $INPUT_FILE`
if ! [[ "$START" =~ "MN401681" ]]; then
 echo "Bad title, must be MN401681"
 exit 1
fi

if ! [[ "$START" == *"Lab02"* ]]; then
 echo "Laboratory number required"
 exit 1
fi
```
----
> #### 3. Rozpocznij przygotowanie środowiska Dockerowego
----
----
----
> #### 4. Działanie środowiska
Pobrano obraz na docker'a, uruchomiono, sprawdzono czy działa i dlaczego się zamyka od razu? Testowanie dockera:
