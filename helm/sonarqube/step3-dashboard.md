**SonarQube service**  представлен как **NodePort**, но со **random** значением. Эта **chart** не позволяет назначать значение **NodePort**. Чтобы **Katacode** предлагал **URL to the service**, **NodePort** должен быть настроен на известный номер 31111. Обходной путь - применить исправление к значению порта.

`kubectl patch service sonar-sonarqube -n sonarqube --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

Посмотреть панель управления **SonarQube dashboard** можно здесь: [SonarQube Dashboard](
https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/).

Вы можете войти как **admin / admin** и просмотреть предустановленные плагины.

Обратите внимание, что **dashboard reports** сообщает, что количество проанализированных проектов равно нулю. С запущенным **SonarQube** он готов **analyze a project**
