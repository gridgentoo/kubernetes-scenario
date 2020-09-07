Теперь вы можете самостоятельно пройти все остальные примеры из учебного модуля **"Istio Hands-On for Kubernetes"** используя интерфейс командной строки. 

Все необходимые исходники соответствующих конфигураций для примеров учебного модуля вы можете найти в дереве встроеного редактора. 

Для вашего удобства напоминаем ссылки на основные инструменты, которые вам понадобятся при прохождении примеров.

## Инструменты

1. Kiali https://[[HOST_SUBDOMAIN]]-31546-[[KATACODA_HOST]].environments.katacoda.com/

    1. Логин: admin
    1. Пароль: admin

1. Jaeger https://[[HOST_SUBDOMAIN]]-31547-[[KATACODA_HOST]].environments.katacoda.com/
1. Grafana https://[[HOST_SUBDOMAIN]]-31548-[[KATACODA_HOST]].environments.katacoda.com/

## Ссылки на приложения

1. Доступ к приложению через IstioIngressGateway https://[[HOST_SUBDOMAIN]]-30128-[[KATACODA_HOST]].environments.katacoda.com/
1. Доступ к приложению с использованием NodePort https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/

## Очистка объектов

`kubectl delete all --all=true && kubectl delete gateways,virtualservices,destinationrules,serviceentries,sidecars --all=true`{{execute T1}}
