## Чтобы завершить инвентаризацию **inventory**, нам нужно обновить файл **hosts**

Поскольку **`openshift-applier`** использует ваш локальный клиент **`oc`** **client**, при запуске он будет нацелен на `localhost` .

```
cat <<EOM >inventory/hosts
[seed-hosts]
localhost ansible_connection=local
EOM
```{{execute}}


``nano inventory/hosts``{{execute}}


На следующем шаге мы создадим сценарий **playbook**
