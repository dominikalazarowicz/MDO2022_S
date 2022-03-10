# Sprawozdanie 1
### 07.03.2022r.

System kontroli wersji Git oraz narzędzie służące do obsługi kluczy SSH jest domyślnie instalowane przy instalacji systemu linux Ubuntu server, dlatego nie było konieczności instalowania ich manualnie.

![git-install](./git-install.png)

Klonuję repozytorium za pomocą protokołu **HTTPS**.

![clone-HTTPS](./clone-HTTPS.png)

Generuję nowy klucz **SSH**.

![ssh-key1](./ssh-key1.png)

Sprawdzam klucz publiczny oraz sprawdzam jego poprawność poprzez wygenerowanie go za pomocą klucza prywatnego.

![ssh-key2](./ssh-key2.png)

Następnie generuję drugi klucz i sprawdzam go w ten sam sposób. Obydwa klucze zostały zabezpieczone hasłem.

![ssh-key3](./ssh-key3.png)

![ssh-key4](./ssh-key4.png)

Dodaje klucz publiczny do konta na **Github**.

![github1](./github1.png)

![github2](./github2.png)

Ponadto dodaje klucz prywatny do **`ssh-agent`**

![ssh-agent](./ssh-agent.png)

Narzędzie **Git** mam już skonfigurowane.

![git-config](./git-config.png)

Klonuje repozytorium za pomocą **SSH**. Operacja się udała co świadczy o poprawnym wygenerowaniu i dodaniu kluczy.

![clone-ssh](./clone-ssh.png)

Przełączam się na gałąź **`main`**.

![main](./main.png)

Następnie przełączam się na gałąź mojej grupy **`INO-GCL02`**.

![gcl02](./gcl02.png)

Tworzę gałąź **`PP401424`**, która wychodzi od gałęzi grupy, oraz tworzę odpowiedni katalog.

![mkdir](./mkdir.png)

Dodaje sprawozdanie oraz zatwierdzam zmiany za pomocą `git add .`

Tworzę commit z komentarzem.

Wysyłam zmiany do zdalnego repozytorium.