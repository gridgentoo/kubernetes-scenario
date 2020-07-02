Попробуйте следующее, чтобы выявить все ресурсы API.

`kubectl get --raw /`{{execute}}

В этом списке есть пространства имен, поэтому запросите **namespaces**.

`kubectl get --raw /api/v1/namespaces`{{execute}}

Один из пространств имен называется **default**, поэтому запросите информацию о **default namespace**.

`kubectl get --raw /api/v1/namespaces/default`{{execute}}

Существует распространенный инструмент Linux под названием **jq**. **jq** похож на **sed** для данных JSON. 

Использование **jq** может значительно облегчить чтение вывода **JSON** из **kubectl** с подсветкой синтаксиса.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

Существует также **Python json.tool**.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

Обратите внимание, что в последней команде мы добавили  [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. 

Установив уровень 9 (самый высокий), мы получим немного больше информации о том, как команда **kubectl** получает возвращаемую информацию.
