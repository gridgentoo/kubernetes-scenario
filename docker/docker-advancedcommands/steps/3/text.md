Как мы можем проверить, что наш контейнер все еще работает? ..

С помощью **docker ps**, так же как и команда **UNIX ps**, выдает список запущенных процессов.

`docker ps`{{execute}}

**Docker** говорит нам:
- (усеченный) идентификатор **ID** нашего контейнера  
- **image** используется для запуска контейнера.
- что наш контейнер **running (Up)** в течение скольких минут. 


## Полезные команды
- Используйте -l **("Last")**, чтобы просмотреть последний запущенный контейнер `docker ps -l`{{execute}}
- Используйте -q **("Quiet", "Quick")**, чтобы перечислить только идентификаторы наших контейнеров `docker ps -q`{{execute}}
- Мы можем объединить -l и -q, чтобы увидеть только идентификатор последнего запущенного контейнера: `docker ps -lq`{{execute}}
