 1. Инсталлируйте шаблон ограничений - **constraint template** белого списка **container registry**:

   `kubectl apply -f registry-whitelist-constraint-template.yaml`{{execute}}
   `nano registry-whitelist-constraint-template.yaml`{{execute}} 

2. Инсталлируйте шаблон ограничений - **constraint template**  - **whitelist** - **container registry** в **quay.io**, чтобы контейнеры были извлечены из реестра доверенных контейнеров **container registry** = **quay.io**:

   `kubectl apply -f registry-whitelist-constraint.yaml`{{execute}}
   `nano registry-whitelist-constraint.yaml`{{execute}} 

3. Создать **pod** и показать **show deny**:  

   `kubectl apply -f registry-whitelist-deny.yaml`{{execute}}
   `nano registry-whitelist-deny.yaml`{{execute}} 

4. Создать **pod** и показать **show success**: 

   `kubectl apply -f registry-whitelist-allow.yaml`{{execute}}
   `nano registry-whitelist-allow.yaml`{{execute}} 

## CHALLENGE

Обновите **ограничение = constraint,** чтобы разрешить другой источник container registry, **gcr.io**.
Затем попробуйте запустить **pod** с **Docker image** `gcr.io/kuar-demo/kuard-amd64:blue`
