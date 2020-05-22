This scenario will start slowly with a simple Go application, progress to a another Go application, then finish up with a microservice based application. Clone this Go source code for all the following steps in this scenario.

`git clone https://github.com/javajon/go-examples && cd go-examples`{{execute}}

The root of the project shows the directories for each step.

`tree`{{execute}}

There is already a local version of Go tools installed for this Katacoda instance. It's not the most recent version, but it will do.

`go version`{{execute}}

> **If the version is less than version `1.12.6` this this Katacoda instance started with the wrong version. This happens sometimes and is a known problem. If this is the case restart this scenario until the version is correct.**

`go env`{{execute}}

The next step will explore a fundamental Hello Go application.
