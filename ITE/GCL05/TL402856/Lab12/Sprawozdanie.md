## Sprawozdanie

### 1. Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML:
1. Wdrożenie z poprzedniego lab wzbogacam o 4 repliki.<br>
![img.png](img.png)<br>
3. Rozpoczynam wdrożenie za pomocą polecenia ```kubectl apply -f petclinic-xd-deployment.yml```:<br>
![img_2.png](img_2.png)<br>
4. Badam stan za pomocą ```kubectl rollout status```:<br>
![img_3.png](img_3.png)<br>

### 2. Przygotowanie nowego obrazu:
1. Na potrzeby laboratorium tworzę failujący obraz. <br>
![img_4.png](img_4.png)<br>
oraz wrzucam go na docker-hub z tagiem wigryz/petclinic:fail<br>
![img_6.png](img_6.png)<br>
2. Lista obrazów na docker-hub:<br>
![img_5.png](img_5.png)<br>

### 3. Zmiany w deploymencie:
1. Zwiększam ilość replik:<br>
![img_7.png](img_7.png)<br>
![img_8.png](img_8.png)<br>
2. Zmniejszam ilość replik do 1:<br>
![img_9.png](img_9.png)<br>
![img_10.png](img_10.png)<br>
![img_11.png](img_11.png)<br>
3. Zmniejszam liczbę replik do 0:<br>
![img_13.png](img_13.png)<br>
![img_12.png](img_12.png)<br>
![img_14.png](img_14.png)<br>
4. Stosuję nową wersję (fail) obrazu (z ustawioną ilością replik na 1):<br>
![img_15.png](img_15.png)<br>
![img_16.png](img_16.png)<br>
Po upływie kilkunastu sekund ubiłem proces rollout status.<br>
![img_17.png](img_17.png)<br>

5. Stosuję starą wersję obrazu (z ustawioną ilością replik na 1):<br>
![img_18.png](img_18.png)<br>
![img_20.png](img_20.png)<br>
Przez chwilę na dashboardzie widniały dwa pody przy czym ich limit wynosił 1.<br>

6. Wylistowuję rollout history poleceniem<br>
```kubectl rollout history deployment.apps/petclinic-xd```:<br>
![img_21.png](img_21.png)<br>
Wypisuję szczegóły rollout revvision 2 poleceniem<br>
```kubectl rollout history deployment.apps/petclinic-xd --revision=2```:<br>
![img_22.png](img_22.png)<br>
Przywracam deployment do wersji --revision=2 poleceniem<br>
```kubectl rollout undo deployment.apps/petclinic-xd --to-revision=2```:<br>
![img_23.png](img_23.png)<br>
![img_24.png](img_24.png)<br>
![img_25.png](img_25.png)<br>

### 4. Kontrola wdrożenia:
1. Napisałem skrypt sprawdzający czy dane wdrożenie przebiegło pomyślnie:
```bash
#!/bin/bash

if [ $# -ne 1 ]; then
	echo "This script requires 1 argument."
	exit
fi

deployment_name=$1

timeout 5 /usr/local/bin/minikube kubectl rollout status $deployment_name

if [ $? -eq 0 ]; then
	echo "Deployment was successful."
else
	echo "Deployment failed."
fi
```

Timeout jest ustalony na 5 sekund, żeby łatwiej było sprawdzić działanie skryptu.<br>
W przypadku powodzenia wyświetla komunikaty:<br>
![img_27.png](img_27.png)<br>
W przypadku niepowodzenia wyświetla komunikaty:<br>
![img_28.png](img_28.png)<br>

### 4. Strategia wdrożenia:
1. Przygotowałem dwie wersje wdrożeń:
   1. Recreate:
      ![img_30.png](img_30.png)<br>
      Najpierw usuwane są poprzednie pody, a następnie tworzone nowe. Powoduje chwilowy brak dostępu do aplikacji.
   2. Rolling Update:
      ![img_29.png](img_29.png)<br>
      Najpierw tworzone są nowe pody, a następnie usuwane stare. Minimalizuje brak dostępu do aplikacji.
      

Historię komend zawiera plik history.txt.