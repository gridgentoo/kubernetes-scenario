Мы уже видели, как получить основную информацию из **Pod**, используя **kubectl get** и **kubectl describe**.
Теперь давайте начнем запускать команды внутри **Pods**, чтобы улучшить наши возможности отладки **debugging**.

## Execute Commands

Мы можем использовать **Kubectl exec** для выполнения команды внутри **Pod**. Формат такой:

`kubectl exec [OPTIONS] pod-name -- [COMMAND]`

Например, чтобы получить список переменных среды **enviroment variable** в запущенном поде **Vue.js**:

`kubectl exec vue -- env`{{execute}}

или запустить **shell** внутри пода:

`kubectl exec -it vue -- /bin/sh`{{execute}}

Теперь, когда у нас есть **shell** внутри нашего **Vue.js Pod**, что происходит? **Pod Vue.js** имеет только **single container**, поэтому у нас есть **shell** в этом контейнере. Почему бы нам не изучить его немного? Мы можем посмотреть на **environment variables**, **processes**, **filesystem**, etc.

Когда вам действительно нужно отладить проблему, вот как вы это сделаете.

Используйте **exit** для выхода из **shell**, запущенного в поде.

