


# Sprawozdanie 02
### 21.03.22
---
Ze względu na problemy z dockerem postanowiłam zmienić SO na którym pracuję i wykonałam zadania z lab01 ponownie na postawionej VM. Repozytorium zostało sklonowane, klucz został wygenerwany, brancha nie tworzyłam nowego. 

## Opis zadań do wykonania
### 1. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami

Na samym początku znaleziono folder `.git` dzięki komendzie `ls -al`. W folderze `.git` znajduję się folder `hook`, do którego należało wejść w celu wykonania dalszych kroków. 

	![01](INO/GCL02/AS302774/Lab02/img/01.PNG)

* hook sprawdzający, czy tytuł commita nazywa się ```<inicjały><numer indeksu>```
	* W celu stworzenia hook'a sprawdzającego tytuł commita, należało, skopiować plik `commit-msg.sample` i zmienić jego nazwę za pomocą kodu `cp commit-msg.sample commit-msg`. Dzięki tym działaniom uzyskaliśmy plik, w którym należało napisać odpowiedni skrypt umożliwiający sprawdzanie tytułu commita. Edycja pliku wykonana została za pomocą komendy `nano commit-msg`. 

	![02](./img/02.png)
	* Kod skryptu napisano w bash
	
	![03](./img/03.png)

* hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania
	* Analogiczne działania z poprzedniego podpunktu wykonano dla pliku `pre-commit.sample`. Skopiowano, zmieniono nazwę i następnie edytowano plik na skrypt w bash umożliwiający sprawdzanie czy commit zawiera w treści numer odpowiedniego labolatorium. 
	
	![04](./img/04.png)
	
	![05](./img/05.png)


### 2. Umieść hook w sprawozdaniu w taki sposób, aby dało się go przejrzeć

W celu tworzenia testów hooków, tworzono kolejne pliki, dodawano je do śledzenia i następnie commitowano. Po commicie wyskakiwał komunikat o tym, czy commit zakończyl się sukcesem czy porażką. 
	-  TESTY HOOKów
		- Poprawny commit-msg
	
![goodcommitAS](./img/goodcommitAS.png)
		- Poprawny pre-commit
	
![prehookgood](./img/prehookgood.png)
		- bledny pre-commit
			- w katalogu Lab02 stworzono plik i mimo commitu z poprawną nazwą ("AS302774"), commit był błędny. Stało się tak ponieważ warunek  pre-commita nie został spełniony. 
			
![badcommitprehook](./img/badcommitprehook.png)
		- poprawny pre-commit i bledny commit-msg
			- edytowano plik test2 istniejacy w katalogu Lab02; commit nadano z bledna wiadomością, ale plik znajduje się w Lab02, więc ścieżka zawierała numer labolatorium. 
			
![badMSGgoodpre](./img/badMSGgoodpre.png)

	
### 3. Rozpocznij przygotowanie środowiska Dockerowego
    * Dokumentacja udowadniająca korzystania z VM przez zdalny terminal 
	    * komendą `sudo systemctl status ssh` sprawdzono status ssh 
	    * połączono się z z VM dzięki programie Putty 
	   
![1](./img/1.png)

![2](./img/2.png)

![3](./img/3.png)

 * zainstaluj środowisko dockerowe w stosowanym systemie operacyjnym
	 * zainstalowano dockera używając repozytorium:
	 1. Zainstalowano dockera korzystając z komendy `sudo apt install docker.io`
	
	![a1](./img/a1.png)
	
	 3. Zaktualizowano listy paczek z repozytorium używając komendy `sudo apt-get update`
	 4. Zainstalowano paczki pozwalające na użycie repozytorium
`sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
`
 
		![a2](./img/a2.png)
		
	 5. Dodano klucz GPG Dockera
![curl](./img/curl.png)
	 6. Doprecyzowano repozytorium stable 
	 ![a3](./img/a3.png)
	 7. Ponownie zupdatowano i doinstalowano Docker Engine 
	![a4](./img/a4.png)
	![a5](./img/a5.png)
	 9. Sprawdzenie poprawnego zainstalowania Dockera używająć obrazu <hello word>
![a6](./img/a6.png) 
	 11.   Sprawdzono wersję dockera
	  ![as](./img/as.png) 

### 4. Działanie środowiska

   * wykaż, że środowisko dockerowe jest uruchomione i działa (z definicji)
	   * uruchomiono środowisko dockera `sudo service docker start`
	    ![b1](./img/b1.png)
	    * wywołano także widok statusów procesów, gdzie można sprawdzićich  istnienie 
	    ![b2](./img/b2.png)
	   
    * wykaż działanie z sposób praktyczny (z własności):
      * pobierz obraz dystrybucji linuksowej i uruchom go 
	      * pobrano obraz fedory z uwagi na korzystanie z ubuntu i sprawdzono poprawność wersji obrazu 
	 
    sudo docker run fedora
    sudo docker images
    
	  
![b3](./img/b3.png)
 
 * wyświetl jego numer wersji
	 * w celu wyświetlania numeru wesji skorzystano z komendy `sudo docker run -it fedora `

![b4](./img/b4.png)
![b5](./img/b5.png)

5. Załóż konto na Docker Hub
![docker](./img/docker.png)
