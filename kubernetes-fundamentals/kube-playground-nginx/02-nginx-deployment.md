   `kubectl create namespace nginx`{{execute}

1. Запустите развертывание **nginx deployment**:

   `kubectl apply -f nginx-deployment.yaml --namespace nginx`{{execute}}
   `watch kubectl get deployments,pods,services --namespace nginx`{{execute}}
 
2. **Forward** - перенаправьте порт 8080 **node** на порт 80 **pod**:

   `kubectl port-forward --address 0.0.0.0 deployment/nginx 8080:80 --namespace nginx`{{execute}}

3. Откройте порт 8080 узла в вашем браузере: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

    `watch kubectl get deployments,pods,services --namespace nginx`{{execute}}
