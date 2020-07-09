Так как этот сценарий полностью посвящен тому, как мы можем использовать **Git** с **Jenkins** для **continuously build** цели на основе коммитов, сделанных в хранилище на **GitHub**, у вас должна быть учетная запись **GitHub**.
Если нет, то создайте аккаунт на **GitHub.com**

После входа в свою учетную запись **GitHub** создайте **new Repository**.
Держите эго пустым пока.

Теперь войдите в **container**:

`docker exec "CONTAINER ID/NAME" /bin/bash`{{execute}}

Для этого сценария мы уже настроили **Git** & **Java** для вас на этом компьютере.

Вы можете проверить, установлены ли они:

`git --version`{{execute}}

`java -version`{{execute}}

Во-первых, мы должны установить два идентификатора для **GIT**. Для этого введите:

	- git config --global user.email "you@example.com"
	- git config --global user.name "Your User Name"
	

Теперь, клонируйте мой репозиторий, который содержит **simple java program**, которую мы будем использовать для нашей демонстрации.
Для этого:

`git clone https://github.com/AjinkyaBapat/JenkinsGitTutorial.git`{{execute}}


Теперь, чтобы перенести этот клонированный репозиторий в свой собственный, вы должны изменить **remote url** из моего репозитория в свой только что созданный репозиторий.
Для этого:

`git remote set-url origin _http://github.com/YOU/YOUR_REPO_`{{execute}}

(Обязательно измените **URL**-адрес вашего собственного хранилища)

Теперь поместите этот локальный репозиторий в ваш удаленный репозиторий:

`git push origin master`{{execute}}

Теперь у вас есть готовый репозиторий для интеграции с Jenkins.

