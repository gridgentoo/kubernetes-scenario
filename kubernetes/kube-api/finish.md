# Заключение #

Сервер **Kubernetes API** является шлюзом в **Kubernetes** и доступен через **HTTP**. Все административные взаимодействия с **Kubernetes** осуществляются через этот **API**. Внешние инструменты командной строки, языковые библиотеки, а также внутренние контроллеры **internal controllers**  и **operators** используют один и тот же **API** для всех операций **CRUD operations** в отношении **Kubernetes**.

## Lessons Learned ##

С помощью этих шагов вы узнали:

- &#x2714; как получить доступ к API через **kubectl**,
- &#x2714; как исследовать **introspect** объекты в кластере через **API**,
- &#x2714; как получить доступ к **API** кластера локально через **Proxy**,
- &#x2714; как ссылаться на **api-resources** и **api-versions**
- &#x2714; как **Explain** и **Describe** ресурсы.

## Особая благодарность
Кену Сипе, который вдохновил этот сценарий из своих лабораторий, найденных здесь.

To **[Ken Sipe](https://www.linkedin.com/in/kensipe/)** который вдохновил этот сценарий из своих лабораторий,[his labs found here](https://github.com/kensipe/k8s-ext-workshop).

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