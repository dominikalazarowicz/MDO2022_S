### Michał Nycz
### Informatyka-Techniczna
### Gr_lab 06


----
#Sprawozdanie
## Metodyki DevOps lab.nr.2

> ## 1. Przygotuj git hook, który rozwiąże najczęstsze problemuy z commitami.
> - hook sprawdzający, czy tytuł commita nazywa się <inicjał numer indeksu>
> - hook sprawdzajacy, czy w treści commita pada numer laby, właściwy dla zadania

----

Na początek przygotowano sobie folder oraz plik do sprawozdania w odpowiednim miejscu:
![image](https://user-images.githubusercontent.com/75485199/159566085-772c95bd-82c3-42c9-b6de-24f80e62d95b.png)

----
skopiowano odpowiedni plik i rozszerzono jego skrypt tak, aby sprawdzał czy wamagania podane powyżej będą spełaniane.
Nadano mu również odpowiednie uprawnienia.
![image](https://user-images.githubusercontent.com/75485199/159566105-18e4ff45-74fd-43d3-a5f0-3f44326fcd5e.png)
----
![image](https://user-images.githubusercontent.com/75485199/159566122-6a251ee0-4540-4ba3-88bf-214c3ade5338.png)

----
> ## 2. Umieść hook w sprawozdaniu w taki sposób, aby dało sięgo przejrzeć.
![image](https://user-images.githubusercontent.com/75485199/159566182-74be1080-b70a-42f0-be79-afe2f6abcceb.png)

----
![image](https://user-images.githubusercontent.com/75485199/159566405-763c3a3f-1535-48f9-8dff-1d28c4aa9749.png)

----

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
![image](https://user-images.githubusercontent.com/75485199/159566451-7abdd7fa-1731-4dd6-8138-8a1cdb4abd8d.png)

----
> ## 3. Rozpocznij przygotowanie środowiska Dockerowego

![image](https://user-images.githubusercontent.com/75485199/159566471-50a6cf4f-6c2b-4542-9b15-8d7476e8c86c.png)

----
![image](https://user-images.githubusercontent.com/75485199/159566490-9aac72c4-a8d3-4e92-96bd-459259c6b154.png)

----

![image](https://user-images.githubusercontent.com/75485199/159566516-def35a9c-f6c8-4850-9bc8-d0f74ffe821c.png)

----

> ## 4. Działanie środowiska
Pobrano obraz na docker'a, uruchomiono, sprawdzono czy działa i dlaczego się zamyka od razu? Testowanie dockera:
![image](https://user-images.githubusercontent.com/75485199/159566539-5664808c-632b-4a30-bb93-a55dea1f6373.png)
----
![image](https://user-images.githubusercontent.com/75485199/159566559-aaa7d1ce-fae2-4540-aed8-037158c4b983.png)
----
> 5. ## Założono konto na Docker Hub

![image](https://user-images.githubusercontent.com/75485199/159567537-b22d9347-c650-4948-8d10-96bbe27f1d9c.png)

