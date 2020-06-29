# Заключение #

Как только приложение находится в контейнере, довольно просто попросить **Kubernetes** обслуживать контейнер в нескольких **Pods**, запущенных с помощью службы балансировки нагрузки **load balancing Service**. После этого **Kubernetes** покорно соблюдает ваш **declared request**, обеспечивая работу приложения в кластере.

Есть много других типов ресурсов, которые могут быть добавлены в **Kubernetes**, кроме просто **Pod**, **Services** и **Deployments**, однако это наиболее распространенные ресурсы. Позже рассмотрим сценарии **Helm**, чтобы увидеть, как можно установить целые **charts** более сложных развертываний **deployments**.

## В этом уроке вы изучили ##

С помощью этих шагов вы узнали:

- &#x2714; how to **Deploy** an application,
- &#x2714; how to **Scale** an application,
- &#x2714; how to load balance an application with a **Service** for multiple **Pods** of an application,
- &#x2714; how **Resilience** maintains the declared state even with failures,
- &#x2714; how to **Roll out** new versions of an application.

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/yunusov.png" width="100" style="border-radius: 12px">
Для более глубокого понимания этих тем и многого другого присоединяйтесь к <br>[Yunusov Temur](https://gridgentoo.github.io/)<br> на различных конференциях, симпозиумах, семинарах и встречах.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & DevOps Specialist</b>
</p>
