# Zachowywanie stanu
### Tworzenie woluminów:
```docker volume create eintrag```  
```docker volume create ausgang```  
Dowód, że istnieją:  
```docker volume ls```  
![](<./Zrzut ekranu 2022-04-03 173526.jpg>)  
Sklonowanie repo do wejsciowego:  
```cd /var/lib/docker/volumes/eintrag/_data```  
```git clone https://github.com/pause1/atari```  
![](<./Zrzut ekranu 2022-04-03 174045.jpg>)  
Doinstalowanie zależności systemowych wewnątrz kontenera:  
```yum install npm```  
czas trwania yuma to naprawdę 😴  
![](<./Zrzut ekranu 2022-04-03 174238.jpg>)  
![](<./Zrzut ekranu 2022-04-03 174439.jpg>)  
Doinstalowanie zależności projektowych:  
```npm install```  
Doinstalowanie konsoli angular:  
```npm install -g @angular/cli```  
Zbudowanie projektu:  
```ng build```  
![](<./Zrzut ekranu 2022-04-03 180304.jpg>)  
Przeniesienie zbuildowanej appki do wyjsciowego:  
```mv dist /a```  
![](<./Zrzut ekranu 2022-04-03 180440.jpg>)  
### Eksponowanie portów na zewnątrz kontenera:  
Wchodzimy do nowego kontenera i odpalamy w nim serwer:  
![](<./Zrzut ekranu 2022-04-03 185427.jpg>)  
![](<./Zrzut ekranu 2022-04-03 181846.jpg>)  
```docker run -it -p 5201:5201 -p 5201:5201/udp costamlab4```  
```iperf3 -s```  
Łączymy się z różnych miejsc:  
```iperf3 -c 172.17.0.2```  
![](<./Zrzut ekranu 2022-04-03 182127.jpg>)  
![](<./Zrzut ekranu 2022-04-03 182323.jpg>)  
Pomiary czasów są na skrinach to już nie wklejam logów.  

### Instalacja jenkinsa  
Komendy w większości pochodzą z dokumentacji jenkinsa (https://www.jenkins.io/doc/book/installing/docker/), jedynie do buildowania użyłem swojej:  
```docker build -t jenk . -f dockerjenkins```  
Wszystko jest dokumentowane na skrinach.  
![](<./Zrzut ekranu 2022-04-03 182759.jpg>)  
![](<./Zrzut ekranu 2022-04-03 182840.jpg>)  
![](<./Zrzut ekranu 2022-04-03 183145.jpg>)  
![](<./Zrzut ekranu 2022-04-03 183154.jpg>)  
![](<./Zrzut ekranu 2022-04-03 183217.jpg>)  
![](<./Zrzut ekranu 2022-04-03 183308.jpg>)  
![](<./Zrzut ekranu 2022-04-03 183939.jpg>)  
