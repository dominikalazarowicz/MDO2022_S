# Sprawozdanie 11
# Kamil Pazgan Inżynieria Obliczeniowa GCL02

## Instalacja klastra Kubernetes

1. W pierwszej kolejności pobrałem i zainstalowałem minikube'a.
![](./screenshots/1_download.PNG)

2. Pojawiły się pierwsze problemy, gdy chcaiłem uruchomić minikube'a:\
![](./screenshots/2_problem.PNG)

Zgodnie z sugestią dodałem urzytkownika do grupy ```docker```.
![](./screenshots/3_problem.PNG)

Następnie ponownie spróbowałem uruchomić minikube'a tym razem z pomyślnym wynikiem.
![](./screenshots/4_minikube_start.PNG)

3. Widoczny działający kontener:
![](./screenshots/5_docker_ps.PNG)

4. Co do wymagań sprzętowych to musiałem zwiększyć ilość rdzeni dla postawionego Ubuntu, ponieważ minikube wymaga 2 lub więcej, Przydzieliłem też więcej pamięci RAM, żeby usprawnić działanie całości.

5. W kolejnym kroku zainstalowałem ```kubectl```.
![](./screenshots/6_kubectl_pods.PNG)

6. Uruchomiłem Dashboard, w przeglądarce:
![](./screenshots/7_kub_dashboard.PNG)
![](./screenshots/8_kub_dashboard.PNG)

## Uruchamianie oprogramowania

1. Wykorzystałem obraz z tutoriala minikube'a do podstawowej prezentacji działania.
![](./screenshots/9_helloworld2.PNG)

Stworzyłem deploy i wyeksponowałem na porcie 8080. Następnie za pomocą ```service``` wystawiałem aplikację działającą na zestawie podów jako usługę sieciową. Na koniec użyłem prekierowania portów żeby możliwe było wejście poprzez ```http://localhost:7080/``` na aplikacje.
![](./screenshots/10_helloworld.PNG)

2. Widok z poziomu dashoboard:
![](./screenshots/11_dash.PNG)
![](./screenshots/12_dash.PNG)
