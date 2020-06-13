Как видите, ваш кластер **Kubernetes** запущен. Убедитесь, что он готов к использованию.

`kubectl version && kubectl cluster-info && kubectl get nodes`{{execute}}

Убедитесь, что кластер **Kubernetes** в стаутсе **empty**.

`kubectl get deployments,pods,services`{{execute}}

Также доступен менеджер пакетов [Helm](https://helm.sh/), используемый для установки приложений в **Kubernetes**.

`helm version`{{execute}}

## Kubernetes Dashboard

Как администратор, вы можете управлять кластером с помощью инструмента CLI **kubectl**. Вы также можете использовать панель управления **Kubernetes Dashboard**. Поскольку к инструментальной панели **dashboard** можно получить общий доступ, она защищена и для входа требуется **secret access token**. Поскольку у вас есть административный доступ к этому кластеру, скопируйте **token** из этого секрета.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

Чтобы получить доступ к панели инструментов **dashboard**, кликните вкладку **Kubernetes Dashboard** над командной строкой или перейдите по этой ссылке: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. В приглашении для входа выберите **Token** и вставьте **токен**, который вы скопировали минуту назад.
