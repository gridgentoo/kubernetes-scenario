В этом сценарии вы узнаете, как настроить **Jenkins** для использования [**Pipelines**](https://wiki.jenkins-ci.org/display/JENKINS/Pipeline+Plugin) на основе Groovy, для создания программного обеспечения из **Github**.

Исходный код плагина
https://github.com/jenkinsci/workflow-aggregator-plugin

Сценарий разработан для демонстрации того, как вы можете использовать **Groovy Pipelines** в **CI/CD pipeline** для загрузки программного кода с [**GitHub**](https://github.com/), выполнения **unit tests** и отображения исторического отчета о результатах тестирования.

Мы используем **Docker host environment**, и мы покажем, как запустить **Jenkins** в контейнере **Docker**. 
Эти шаги помогут вам установить необходимые плагины, создать сборку и просмотреть результаты отчета о тестировании.