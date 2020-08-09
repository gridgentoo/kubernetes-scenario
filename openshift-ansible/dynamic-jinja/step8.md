## Еще раз перейдите на вкладку **`Dashboard`** в этой среде

Вы должны заметить, что там написано:

`A new deployment will start automatically when an image is pushed to not-a-ruby-example/ruby-ex:latest.`

`Новое развертывание начнется автоматически, когда **image** будет запущен в **not-a-ruby-example/ruby-ex:latest**.`

Обратите внимание, что он думает, что сборка **build** будет из пространства имен **`not-a-ruby-example`** !

Потому что переменная **`params_from_vars`** перезаписала файловую переменную **`params`**, а **`NAMESPACE_BUILD: not-a-ruby-example`** - некорректное пространство имен!

The easy way to fix this would be to change this:

Самый простой способ исправить это - изменить следующее:

`NAMESPACE_BUILD: not-a-ruby-example` 

к этому:

`NAMESPACE_BUILD: ruby-example`

в нашем **`inventory/group_vars/all.yml`**

``nano inventory/group_vars/all.yml``{{execute}}

Но давайте исправим наш **inventory** с помощью динамических переменных **dynamic variables** по-другому ...