## Для начала давайте войдем в **OpenShift cluster**, выполнив следующее: 

``oc login -u developer -p developer``{{execute}}

Для начала давайте создадим новый каталог и войдем в него.

``mkdir sample-applier; cd sample-applier``{{execute}}

Чтобы завершить общую структуру проекта, мы хотим создать остальную структуру проекта:

```
.
├── inventory
│   ├── group_vars
│   │   └── all.yml
│   └── hosts
├── params
│   ├── ruby
│   └── projectrequests
├── projectrequests
├── requirements.yml
└── templates
    ├── app
    └── project
```

Давайте продолжим и создадим эту структуру:

```
mkdir -p inventory/group_vars params/{ruby,projectrequests} templates/{app,project}
```{{execute}}

А теперь файлы:

``` 
touch inventory/group_vars/all.yml inventory/hosts requirements.yml
```{{execute}}