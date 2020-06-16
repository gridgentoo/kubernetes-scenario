# SonarQube on Kubernetes #

![SonarQube](/javajon/courses/kubernetes-pipelines/sonarqube/assets/sonarqube.png "Анализ кода с помощью SonarQube on Kubernetes.")

> [SonarQube](https://www.sonarqube.com)  платформа с открытым исходным кодом для непрерывного анализа (англ. **continuous inspection**) и измерения качества кода с целью проведения автоматического анализа **automatic reviews** со статическим анализом кода s**tatic analysis** для обнаружения ошибок **bugs**, **code smells** и уязвимостей безопасности в 27+ языки программирования. SonarQube предлагает отчеты о дублированном коде **duplicated code**, стандартах кодирования **coding standards,** модульных тестах **unit tests**, покрытии кода **code coverage**, сложности кода **code complexity**, комментариях, ошибках и уязвимостях безопасности.  [-- Wikipedia](https://en.wikipedia.org/wiki/sonarqube)

Поддерживает анализ кода и поиск ошибок согласно правилам стандартов программирования **MISRA C, MISRA C++, MITRE/CWE и CERT Secure Coding Standards**. А также умеет распознавать ошибки из списков **OWASP** Топ-10 и **CWE/SANS** Топ-25 ошибок программирования.

Несмотря на то, что платформа использует различные готовые инструменты, SonarQube сводит результаты к единой информационной панели (англ. dashboard), ведя историю прогонов и позволяя тем самым увидеть общую тенденцию изменения качества программного обеспечения в ходе разработки.

SonarQube измеряет качество программного кода в соответствии с семью показателями (и соответствующими метриками) качества программного обеспечения, которые разработчики называют англ. **Seven Axes of Quality**:

- Потенциальные ошибки
- Стиль программирования
- Тесты
- Повторения участков кода
- Комментарии
- Архитектура и проектирование
- Сложность

Так, тесты оцениваются не только с точки зрения успешности исполнения, но и по тестовому покрытию исходного кода.

Во главу угла в **SonarQube** поставлено измерение качества в соответствии с концепцией технического долга (англ. **technical debt**), реализованное в виде плагина. Долг вычисляется в долларах и человеко-днях, а также по типам показателей, в процентах

Настройка ваших **SonarQube services** как **fragile** [snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html) является распространенным и не рекомендуемым методом. Любой разработчик должен иметь возможность быстро запустить личный сервис **SonarQube**, а также полагаться на него **team's service** которая соответствует тому же **behaviors**. Последняя версия **SonarQube**, ее плагины и его конфигурации также должны легко настраиваться. Ваши процессы жизненного цикла разработки программного обеспечения **lifecycle processes (SDLC)** должны охватывать версионную конфигурацию и деплоймент **SonarQube** в различных [cattle (not pets)](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/) **targets**.

Следуйте этим инструкциям, чтобы настроить персональный [SonarQube engine and dashboard](https://www.sonarqube.org). 
Благодаря этому у вас есть надежный инструмент статического анализа кода, поддерживающий весь код перед тем, как вы отправите свою работу на **pull request**. 
В **SonarQube** есть плагины, такие как [Checkstyle](http://checkstyle.sourceforge.net/), [PMD](https://pmd.github.io/) и [Findbugs](http://findbugs.sourceforge.net/). Плагин **Findbugs** включает правила для уязвимостей, такие как [OWASP top 10](http://find-sec-bugs.github.io).

Вы узнаете, как:

- установить **SonarQube** на **Kubernetes**
- использовать **Helm** для установки **SonarQube**
- как конфигурировать **SonarQube plugins** с чартами
- для доступа к **SonarQube Dashboard**
- как анализировать кода и **inspect results** с помощью плагина **Gradle**

[Интеграция проекта VueJS+TS с SonarQube](https://habr.com/ru/company/odin_ingram_micro/blog/488242/).  
[SonarQube и IntelliJ IDEA: правильная интеграция](https://habr.com/ru/company/krista/blog/469963/).  
[Deploy SonarQube Server](https://habr.com/ru/post/474140/)
