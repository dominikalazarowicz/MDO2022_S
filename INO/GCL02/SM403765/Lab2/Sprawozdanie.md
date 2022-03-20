# Hooki

## Sprawdzenie tutułu commita SM403765

commit-msg
```bash
#!/bin/sh

if test $(cat $1) = SM403765
then
  echo "Correct commit"
else
  echo "Bad commit"
  exit 1
fi
```

![Branch w commicie](./commit_branch.png)
<figcaption align = "center">Zrzut 1. Sprawdzenie zawartości brancha w commicie</figcaption>


## Sprawdzenie czy tutule commita zawiera się numer laboratorium

commit-msg

```bash
#!/bin/sh

if (cat $1) | grep -Eq '(Lab2)'
then
  echo "Correct commit"
else
  echo "Bad commit"
  exit 1
fi
```

![Lab nr w commicie](./commit_lab_nr.png)
<figcaption align = "center">Zrzut 2. Sprawdzenie zawartości numeru labów w commicie</figcaption>


# Docker

## Dostęp do maszyny


![Dostęp do VM](./oci_term.png)
<figcaption align = "center">Zrzut 3. Konfiguracja Windows Terminal </figcaption>

## Wykazanie remote

![Dostęp po ssh](./oci_login.png)
<figcaption align = "center">Zrzut 4. Logowanie po SSH </figcaption>

## Zainstalowanie dockera

![Dostęp po ssh](./docker_v.png)
<figcaption align = "center">Zrzut 5. Wersja zainstalowanego dockera </figcaption>

## Działanie

![Status docker](./docker_status.png)
<figcaption align = "center">Zrzut 6. status serwisu docker </figcaption>

![Status containerd](./containerd_status.png)
<figcaption align = "center">Zrzut 7. status serwisu containerd </figcaption>



## Numer wersji

![Docker ps](./docker_ps.png)
<figcaption align = "center">Zrzut 8. Docker ps </figcaption>


![Docker ubuntu status](./ubuntu_docker.png)
<figcaption align = "center">Zrzut 9. Ubuntu container status</figcaption>

![Docker ubuntu ps](./ubuntu_docker_ps.png)
<figcaption align = "center">Zrzut 10. Ubuntu container init PID</figcaption>

# Konto Docker Hub

![Docker Hub](./docker_hub.png)
<figcaption align = "center">Zrzut 11. Konto w docker Hub</figcaption>