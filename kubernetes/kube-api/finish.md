# Заключение #

Сервер **Kubernetes API** является шлюзом в **Kubernetes** и доступен через **HTTP**. Все административные взаимодействия с **Kubernetes** осуществляются через этот **API**. Внешние инструменты командной строки, языковые библиотеки, а также внутренние контроллеры **internal controllers**  и **operators** используют один и тот же **API** для всех операций **CRUD operations** в отношении **Kubernetes**.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to access the API via `kubectl`,
- &#x2714; how to introspect objects in the cluster via the API,
- &#x2714; how to access the cluster API locally through a Proxy,
- &#x2714; how to reference api-resources and api-versions
- &#x2714; how to `Explain` and `Describe` resources.

## Special Thank You

To **[Ken Sipe](https://www.linkedin.com/in/kensipe/)** as he inspired this scenario from [his labs found here](https://github.com/kensipe/k8s-ext-workshop).

## References ##

- [The Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)
- [Kubectl Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [jq](https://stedolan.github.io/jq/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/yunusov.png" width="100" style="border-radius: 12px">
Для более глубокого понимания этих тем и многого другого присоединяйтесь к <br>[Yunusov Temur](https://gridgentoo.github.io/)<br> на различных конференциях, симпозиумах, семинарах и встречах.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & DevOps Specialist</b>
</p>