Этот сценарий был протестирован с этой версией Istio:

`export ISTIO_VERSION=1.7.5`{{execute}}

По мере поступления новых версий этот сценарий будет обновляться. На эту версию `ISTIO_VERSION` будет ссылаться установщик.

## Istio operator

**Kubernetes Operator pattern** жизненно важен для многокомпонентных решений, инсталлируемых на **Kubernetes**. Часто эти **Operators** инсталлируются вместе с **Helm package manager** для **Kubernetes**. Хотя **Istio operator** инсталлируются с помощью Helm, установка **Istio** изолирует вас от этой **dependency**. 
В этом сценарии мы следуем рекомендациям (начиная с версии **1.6**) по инсталляции **Istio operator** с помощью его установщика.

Загрузите **Istio package**:

`curl -L https://istio.io/downloadIstio | sh -`{{execute}}

Инсталлируйте **Istio** в командной строке:

`export PATH="$PATH:/root/istio-${ISTIO_VERSION}/bin"`{{execute}}

Проверьте версию **istio** в командной строке:

`istioctl version`{{execute}}

Появится версия и сообщение:

`no running Istio pods in "istio-system"` 

**`Нет запущенных подов в Istio в" istio-system "`** ожидается, так как ничего еще не началось.

Инициализируйте Istio в этом кластере Kubernetes. Это запустит **operator** и, в свою очередь, **operator** будет управлять установкой и конфигурацией Istio для этого кластера.

`istioctl install --set profile=demo`{{execute}}

Есть несколько профилей на выбор [profiles to choose from](https://istio.io/latest/docs/setup/additional-setup/config-profiles/) на основе списка **Istio features**, которые вы хотите включить. Для этого сценария с информацией о книге идеально подходит профиль **_Demo_**.
 
Через несколько минут будет доступен **Istio**. После завершения. Вы можете убедиться, что **Istio** готов:

Посмотрим какие деплойменты:

`kubectl get deployments -n istio-system`{{execute}}

Посмотрим какие сервисы:

`kubectl get services -n istio-system`{{execute}}

**`deployment.apps/istiod`** - это основной компонент плоскости управления **control plane Istio**.

 Внутри **_istiod_** находятся ключевые компоненты, такие как **Pilot**, **Citidel**, **Gally** и другие. 
 
 В недавней версии Istio было сочтено, что единый процесс **istiod** лучше, чем разбиение каждого основного компонента на отдельные **Deployments** и **Pod**.

Команда **version** перечислит версии клиента, **control plane**, и **data plane**:

`istioctl version`{{execute}}

Более глубокая проверка инсталляции выполняется путем загрузки существующих конфигураций:

`istioctl manifest generate --set profile=demo > $HOME/istio-generated-manifest.yaml`{{execute}}

Профиль **_demo_** был выбран как лучшая конфигурация для обучения в этом сценарии. [Здесь] описаны другие общие профили конфигурации [here](https://istio.io/latest/docs/setup/additional-setup/config-profiles/).

Используйте **`verify-installation`**, чтобы увидеть, соответствуют ли объявления реальности того, что выполняется:

`istioctl verify-install -f $HOME/istio-generated-manifest.yaml`{{execute}}

Если все в порядке, вы должны увидеть список сообщений **`checked successfully`** для компонентов Istio.
