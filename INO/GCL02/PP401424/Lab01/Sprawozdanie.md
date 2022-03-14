# Sprawozdanie 1
### 07.03.2022r.

System kontroli wersji Git oraz narzêdzie s³u¿¹ce do obs³ugi kluczy SSH jest domyœlnie instalowane przy instalacji systemu linux Ubuntu server, dlatego nie by³o koniecznoœci instalowania ich manualnie.

![git-install](./git-install.png)

Klonujê repozytorium za pomoc¹ protoko³u **HTTPS**.

![clone-HTTPS](./clone-HTTPS.png)

Generujê nowy klucz **SSH**.

![ssh-key1](./ssh-key1.png)

Sprawdzam klucz publiczny oraz sprawdzam jego poprawnoœæ poprzez wygenerowanie go za pomoc¹ klucza prywatnego.

![ssh-key2](./ssh-key2.png)

Nastêpnie generujê drugi klucz i sprawdzam go w ten sam sposób. Obydwa klucze zosta³y zabezpieczone has³em.

![ssh-key3](./ssh-key3.png)

![ssh-key4](./ssh-key4.png)

Dodaje klucz publiczny do konta na **Github**.

![github1](./github1.png)

![github2](./github2.png)

Ponadto dodaje klucz prywatny do **`ssh-agent`**

![ssh-agent](./ssh-agent.png)

Narzêdzie **Git** mam ju¿ skonfigurowane.

![git-config](./git-config.png)

Klonuje repozytorium za pomoc¹ **SSH**. Operacja siê uda³a co œwiadczy o poprawnym wygenerowaniu i dodaniu kluczy.

![clone-ssh](./clone-ssh.png)

Prze³¹czam siê na ga³¹Ÿ **`main`**.

![main](./main.png)

Nastêpnie prze³¹czam siê na ga³¹Ÿ mojej grupy **`INO-GCL02`**.

![gcl02](./gcl02.png)

Tworzê ga³¹Ÿ **`PP401424`**, która wychodzi od ga³êzi grupy, oraz tworzê odpowiedni katalog.

![mkdir](./mkdir.png)

Dodaje sprawozdanie oraz zatwierdzam zmiany za pomoc¹ `git add .`

![git-add](./git-add.png)

Tworzê commit z komentarzem.

![git-commit](./git-commit.png)

Wysy³am zmiany do zdalnego repozytorium.

![git-push](./git-push.png)