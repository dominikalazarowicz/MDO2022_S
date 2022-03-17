# Metodyki devops - git hooks, ssh, docker


## Wykonanie laboratorium:


**1. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami**   
   * **hook sprawdzający, czy tytuł commita nazywa się <inicjały><numer indeksu>**
   * **hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania**

      Należy przejrzeć ukryte katalogi za pomocą ls -al, przejść do ścieżki ``` \.git\hooks\ ``` i zmodyfikować te, które są używane w naszym zadaniu. Dodatkowo nadaje konieczne uprawnienia.

      ![x](./hooks.png)

    Tworzę skrypt, którego zadaniem jest sprawdzanie tytułu commita. Wykorzystałem do tego hook commit-msg. Jest on wykonywany w trakcie tworzenia wiadomości commita. W argumencie ```$1``` znajduje się treść wiadomości. W skrypcie poprzez funkcję test porównuję wartość zmiennej i sprawdzam czy zawiera ona wartosć ```PW404121``` będąca konkatenacją inicjału oraz numeru indeksu. W zależności od uzyskanego wyniku wyświetlam odpowiednią informację.

      ```bash
      echo -e "\nTesting commit message..."

      if test $(cat $1) = PW404121
      then
        echo -e "${GREENBOLD}Commit message is equal PW404121 ${NORMAL}\n"
      else
        echo -e "${REDBOLD}Commit message is NOT equal PW404121 ${NORMAL}\n"
        exit 1
      fi
      ``` 

      W kolejnym skrypcie, w którym należy sprawdzić treść commita postepuję podobnie. Tym razem poprzez ```git deff``` z przełącznikiem ```cached``` sprawdzam czy w przygotowanych do zcommitowania zmianach zawiera się wartość ```/Lab02/```. W wyniku takiego działania commit zostanie zaakceptowany gdy zostaną dokonane zmiany w katalogu aktualnych laboratoriów. Tym razem modyfikowany był hook ```pre-commit```, który jest wykonywany przed utworzeniem wiadomości.

      ```bash
      echo -e "\nTesting commit content..."

      if git diff --cached | grep "/Lab02/"
      then
        echo -e  "${GREENBOLD}Commit contain current laboratory number - 02 ${NORMAL}\n"
      else
        echo -e "${REDBOLD}Commit does NOT contain current laboratory number - 02 ${NORMAL}\n"
        exit 1
      fi
      ``` 

      ![x](./hook1.png)

**2. Umieść hook w sprawozdaniu w taki sposób, aby dało się go przejrzeć**

  Hooki zostaly umieszczone w katalogu ```/Lab02/```, ich treści znajdują się też inline w sprawozdaniu powyżej

**3. Rozpocznij przygotowanie środowiska Dockerowego**
    * **Zapewnienie dostępu do wirtualnej maszyny przez zdalny terminal, wykorzystując SSH**
     ![x](./sshd_status.png)

    ![x](./ifconfig.png)

    ![x](./windows_ubuntu.png)

    ![x](./przed_przeslaniem.png)

    ![x](./po_przeslaniu.png)

        
   * **środowisko dockerowe miałem zainstalowane już przed laboratorium**
    ![x](./docker_ver.png)
    

**4. Działanie środowiska**

   * **wykaż, że środowisko dockerowe jest uruchomione i działa (z definicji - systemctl status docker):**

        ![x](./docker_ver.png)
  
      * **wykaż działanie z sposób praktyczny (z własności):**
      * **pobierz obraz dystrybucji linuksowej i uruchom go**
      * **wyświetl jego numer wersji**

        Najpierw spullowałem obraz Ubuntu:
       ![x](./ubuntu_pull.png)

        Po pobraniu obrazu wykazuje jego działanie i uruchamiam poprzez ```docker run```.
       ![x](./images.png)
       ![x](./docker1.png)

        Na koniec wyświetlam numer wersji orbazu.
       ![x](./kontener.png)       

**5. Załóż konto na Docker Hub**

Zakładam konto z podstawowym personalnym planem.

  ![Email confirmation](./dockerhub1.png)

  ![Docker profile](./img/dockerhub2.png)

