Blog post: https://medium.com/@alessandro.demaria/adb6a488cd77

Давайте удалим функцию **`features.brine`** из среды **`dev-sea`**.

`sed -i '/features.brine/d' inventory/targets/dev-sea.yml`{{execute}}

`kapitan compile`{{execute}}

`git status`{{execute}}
