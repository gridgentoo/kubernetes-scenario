
Мы развернем три микросервиса (**customer**, **preference**, **recommendation**), реализованных с использованием **Spring Boot** и **Vert.x**.

Микросервис **`customer`** отправляет запрос **`preference`**, который запрашивает **`recommendation`**.

Давайте развернем каждый из них в новом проекте **new project** под названием **`tutorial`**.

Чтобы создать новый проект, выполните
`oc new-project tutorial`{{execute T1}}

Теперь давайте добавим  **`privileged`** **SCC** к этому проекту.

**Execute:** `oc adm policy add-scc-to-user privileged -z default -n tutorial`{{execute T1}}
