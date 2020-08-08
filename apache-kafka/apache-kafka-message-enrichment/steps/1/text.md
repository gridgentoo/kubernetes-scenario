На этом этапе мы настроим редактор **VScode** и **clone repository**.

Клонируйте следующий репозиторий, скопировав и выполнив следующую команду в **vscode terminal**.

`git clone https://github.com/athertahir/kafka.git`{{execute}}

#### Permissions

Теперь перейдите в каталог, содержащий сценарии для установки kafka, скопируйте и выполните команду. Нам также необходимо изменить разрешение **permission** на выполнение скрипта с помощью  **chmod**.

`cd kafka/setup && chmod 755 *.sh`{{execute T1}} 

`./install.sh && ./start.sh && cd ../Chapter03/monedero`{{execute T1}} 

**Note:**
- Команды, представленные на следующих шагах, ДОЛЖНЫ запускаться из подкаталога `Chapter03/monedero` клонирования репозитория **kafka**. 
- **Final code** для этого сценария уже был клонирован с github. Вы можете просто понять код приложения на следующих шагах и запустить его, следуя инструкциям.
- Кликните **IDE Editor** чтобы открыть **Visual Studio**, и выберите проводник, как показано ниже::

![](https://github.com/fenago/katacoda-scenarios/raw/master/apache-kafka/1.JPG)


