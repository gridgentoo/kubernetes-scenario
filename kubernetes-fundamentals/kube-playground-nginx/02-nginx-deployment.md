1. Запустите развертывание **nginx deployment**:

   `kubectl apply -f nginx-deployment.yaml`{{execute}}

1. **Forward** - перенаправьте порт 8080 **node** на порт 80 **pod**:

   `kubectl port-forward --address 0.0.0.0 deployment/nginx 8080:80`{{execute}}

1. Откройте порт 8080 узла в вашем браузере: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
