Blog post: https://medium.com/@alessandro.demaria/adb6a488cd77

Удалим компонент **`components.tuna`** из окружения **`dev-sea`**.

`sed -i '/components.tuna/d' inventory/targets/dev-sea.yml`{{execute}} 

`kapitan compile`{{execute}}

`git status`{{execute}}


ПОЖАЛУЙСТА, ОБРАТИТЕСЬ К ДОПОЛНИТЕЛЬНОЙ ИНСТРУКЦИИ В БЛОГЕ
