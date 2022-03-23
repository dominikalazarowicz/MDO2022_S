| Imię i nazwisko  | Grupa | Data ćwiczenia     |
|------------------|-------|------------|
| Radosław Jurczak | 03    | 17.03.2022 |

## 1. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami
* hook sprawdzający, czy tytuł commita nazywa się RJ306452
* hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania

W pliku .git/hooks/commit-msg zapisano skrypt sprawdzający powyższe wartości.
Następnie, aby umożliwić uruchamianianie skryptu, zmieniono uprawnienia do pliku przy użyciu polecenia `chmod +x commit-msg`  
![](1.png)  
Test działania hook'a:  
![](2.png)

## 2. Umieść hook w sprawozdaniu w taki sposób, aby dało się go przejrzeć
```
#!/bin/sh
test -n "$(grep 'RJ306452' ${1})" || {
        echo >&2 "Name must contain 'RJ306452' !"
        exit -1
}
test -n "$(grep 'Lab02' ${1})" || {
        echo >&2 "Name must contain 'Lab02' !"
        exit -1
}
```
## 3. Rozpocznij przygotowanie środowiska Dockerowego 
* zapewnij dostęp do maszyny wirtualnej przez zdalny terminal (nie "przez okienko")

Skonfigurowano maszynę wirtualna tak aby działała w tej samej sieci (Wyłączenie NAT).  
![](3.png)
Zainstalowanie OpenSSH.  
![](4.png)
Sprawdzenie działania usługi sshd:  
![](5.png)
Przypisanie maszynie wirtualnej stałego adresu IP. Od razu sprawdzono dostępność VM przy użyciu pinga.  
![](6.png)
Aby umożliwić łączenie poprzez SSH z maszyną wirtualną, musimy odblokować port i uruchomić zaporę sieciową:  
![](7.png) 
Sprawdzenie połączenia przy użyciu PuTTY:  
![](8.png)

Z domyślnej konsolii Windowsa połączenie poprzez `ssh rj@10.0.0.100` również zadziałało bezproblemowo.

* zainstaluj środowisko dockerowe w stosowanym systemie operacyjnym
Instalacja Dockera:  
![](9.png)  

![](10.png)

## 4. Działanie środowiska 
* wykaż, że środowisko dockerowe jest uruchomione i działa (z definicji)

Uruchomienie testowej aplikacji:  
![](11.png)

* wykaż działanie z sposób praktyczny (z własności):
	* pobierz obraz dystrybucji linuksowej i uruchom go
	* wyświetl jego numer wersji		
		Pobranie obrazu ubuntu: `sudo docker pull ubuntu`
		![](12.png)
		
		Uruchomienie: `sudo docker run ubuntu` i wyświetlenie wersji:
		![](13.png)
		
## 5. Załóż konto na Docker Hub
Konto utworzone już w zeszłym roku 🤠  
![](14.png)