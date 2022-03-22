# ***Ćwiczenia 2***

## 1. Przygotowanie git hook

![1.png](/Lab02/1.png)

- hook sprawdzający, czy tytuł commita nazywa się <inicjały><numer indeksu>
- hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania

```
title=`head -n1 $1`
message=`tail -n1 $1`
message_num="(2)"
title_patt="KL299629"
message1="Title is wrong!"
message2="Wrong commit message!"

if ! [ "$title" = $title_patt ]; then
	echo $message1
	exit 1
fi

if ! [[ "$message" =~ .*$message_num.* ]]; then
	echo $message2
	exit 1
fi

```

Sprawdzenie czy hooki działają:

![1a.png](/Lab02/1a.png)

## 2. Przygotowanie środowiska Dockerowego

Zadanie wykonywane na Linuxie 
```cat /proc/version ```

![3a.png](/Lab02/3a.png)

Sprawdzenie statusu zainstalowanego Dockera komendą ```sudo systemctl status docker```


![3.png](/Lab02/3.png)


## 3. Działanie środowiska

- środowisko dockerowe jest uruchomione i działa (z definicji)

![3.png](/Lab02/3.png)

- działanie w sposób praktyczny (z własności):
	- pobranie ubuntu - użyta komenda ```docker pull ubuntu```

![4.png](/Lab02/4.png)

- Uruchomienie obrazu Ubuntu. Użyte komendy:
	- ```docker run ubuntu```
	- ```sudo docker ps -a```

![5.png](/Lab02/5.png)

## 4. Rejestracja w Docker Hub

![6.png](/Lab02/6.png)



