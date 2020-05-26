### Масштабируйте развертывание и мониторьте новые pods 
Перечислите существующие развертывания:

`kubectl get deployments`{{execute HOST1}}

```
NAME                    DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
frontend                1         1         1            1           6m
hello-java-deployment   1         1         1            1           6m
redis-master            1         1         1            1           6m
redis-slave             1         1         1            1           6m
```

Масштабируйте приложение Spring до двух реплик:

`kubectl scale --replicas=2 deployment/hello-java-deployment`{{execute HOST1}}

