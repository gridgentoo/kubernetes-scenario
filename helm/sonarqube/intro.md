# SonarQube on Kubernetes #

![SonarQube](/javajon/courses/kubernetes-pipelines/sonarqube/assets/sonarqube.png "Анализ кода с помощью SonarQube on Kubernetes.")

> [SonarQube](https://www.sonarqube.com)  платформа с открытым исходным кодом для непрерывного анализа (англ. continuous inspection) и измерения качества кода с целью проведения автоматического анализа **automatic reviews** со статическим анализом кода s**tatic analysis** для обнаружения ошибок **bugs**, **code smells** и уязвимостей безопасности в 27+ языки программирования. SonarQube предлагает отчеты о дублированном коде **duplicated code**, стандартах кодирования **coding standards,** модульных тестах **unit tests**, покрытии кода **code coverage**, сложности кода **code complexity**, комментариях, ошибках и уязвимостях безопасности.  [-- Wikipedia](https://en.wikipedia.org/wiki/sonarqube)

Поддерживает анализ кода и поиск ошибок согласно правилам стандартов программирования MISRA C, MISRA C++, MITRE/CWE и CERT Secure Coding Standards. А также умеет распознавать ошибки из списков OWASP Топ-10 и CWE/SANS Топ-25 ошибок программирования.

Несмотря на то, что платформа использует различные готовые инструменты, SonarQube сводит результаты к единой информационной панели (англ. dashboard), ведя историю прогонов и позволяя тем самым увидеть общую тенденцию изменения качества программного обеспечения в ходе разработки.

SonarQube измеряет качество программного кода в соответствии с семью показателями (и соответствующими метриками) качества программного обеспечения, которые разработчики называют англ. Seven Axes of Quality:

- Потенциальные ошибки
- Стиль программирования
- Тесты
- Повторения участков кода
- Комментарии
- Архитектура и проектирование
- Сложность

Так, тесты оцениваются не только с точки зрения успешности исполнения, но и по тестовому покрытию исходного кода.

Во главу угла в SonarQube поставлено измерение качества в соответствии с концепцией технического долга (англ. technical debt), реализованное в виде плагина. Долг вычисляется в долларах и человеко-днях, а также по типам показателей, в процентах

Setting up your SonarQube services as fragile [snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html) is both common and not a recommended technique. Any developer should be able to quickly start a personal SonarQube service as well as rely on a team's service that matches the same behaviors. The latest SonarQube version, its plugins, and its configurations should also be easily adjustable. Your software development lifecycle processes (SDLC) should embrace the versioned configuration and deployment of SonarQube across a variety of [cattle (not pets)](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/) targets.

Follow these instructions to set up a personal [SonarQube engine and dashboard](https://www.sonarqube.org). With this, you have a strong, static code analysis tool backing your code all before you submit your work for a pull request. Within SonarQube there are plugins such as [Checkstyle](http://checkstyle.sourceforge.net/), [PMD](https://pmd.github.io/) and [Findbugs](http://findbugs.sourceforge.net/). The Findbugs plugin includes rules for vulnerabilities such as the [OWASP top 10](http://find-sec-bugs.github.io).

You will learn how:

- to install SonarQube onto Kubernetes
- to use Helm to install SonarQube
- to configure SonarQube plugins with the chart
- to access the SonarQube Dashboard
- to analyze code and inspect results with a Gradle plugin
