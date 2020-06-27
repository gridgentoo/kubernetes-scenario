
Прежде чем исследовать темы наблюдаемости **observability**, запустите небольшое приложение, чтобы предоставить что-то для наблюдения **observe**.

Запустите 3 экземпляра контейнера **random-logger**, чтобы начать генерировать непрерывно случайные **logging events**.

`kubectl create deployment random-logger --image=chentex/random-logger`{{execute}}

показать объединённые настройки **kubeconfig**

`kubectl config view`{{execute}}

нажмите ```clear```{{execute interrupt}} 

Вы также можете использовать короткий псевдоним для **kubectl**, напиример

`k config view`{{execute}}

## **Scale** Масштабруемся до 3 **instances**.

`kubectl scale deployment/random-logger --replicas=3`{{execute}}

**3 pods** подымутся в ближайшее время.

`kubectl get pods`{{execute}}

> Спасибо **Vicente Zepeda** за предоставление этого красивого простого контейнера. [Исходный код здесь](https://github.com/chentex/random-logger).
