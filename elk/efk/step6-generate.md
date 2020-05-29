Запустите этот контейнер, чтобы начать генерировать случайные логги **log events**.

`kubectl run random-logger --image=chentex/random-logger --generator=run-pod/v1`{{execute}}

>Спасибо **Vicente Zepeda** за предоставление этого [beautifully simple container](https://github.com/chentex/random-logger).

События log events будут выглядеть примерно так.

```
...
2019-03-27T11:06:25+0000 INFO takes the value and converts it to string.
2019-03-27T11:06:29+0000 DEBUG first loop completed.
2019-03-27T11:06:31+0000 ERROR something happened in this execution.
2019-03-27T11:06:46+0000 WARN variable not in use.
...
```

Проверьте фактические события **log events**, которые теперь генерируются с помощью этой команды **kubectl logs**.

`kubectl logs pod/random-logger`{{execute}}

Не пугайтесь сообщений, это всего лишь примеры.