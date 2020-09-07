Некоторые примеры в модуле **"Istio Hands-On for Kubernetes"**, используют конфигурацию сервисов с использованием типа NodePort. При этом, в таких примерах не используется абстракция IstioIngressGateway. 

Вы можете встретить такие конфигурации в файлах 5-application-no-istio.yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: fleetman-webapp
spec:
  selector:
    app: webapp
  ports:
    - name: http
      port: 80
      nodePort: 30080
  type: NodePort
```

Это означает, что сервис fleetman-web-app доступен извне по порту 30080 (значение параметра NodePort). Подробнее об этом можно почитать в официальной документации Kubernetes [Type NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport)

## Как использовать

1. Изучите пример конфигурации `/root/exercise/1_Telemetry/5-application-no-istio.yaml`. Для удобства вы его можете открыть во встроенном редакторе `/1_Telemetry/5-application-no-istio.yaml`{{open}}. 
1. Запустите пример `kubectl apply -f /root/exercise/1_Telemetry/5-application-no-istio.yaml`{{execute T1}}
1. Важно. **Убедитесь, что все поды приложения находятся в статусе Running прежде чем двигаться дальше** `kubectl get pods`{{execute T1}}
1. Откройте UI приложения https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/ и убедитесь, что вы видите работающее приложения трекинга водителей. Так платформа Katacoda производит маппинг порта 30080 вашего кластера на внешние общедуоступные ссылки.
1. Повторите за автором модуля **"Istio Hands-On for Kubernetes"** все действия из раздела **"Section 5: Telemetry"** начиная с пункта **"16. Kiali Deeper Dive"**

## Удалить все объекты

Прежде чем перейти к следующему шагу, удалите все объекты из текущего пространства имен `kubectl delete all --all=true && kubectl delete gateways,virtualservices,destinationrules,serviceentries,sidecars --all=true`{{execute T1}}

## TroubleShoot

Если что-то пошло не так:

* перезагрузите страницу упражнения и начните сценарий заново.