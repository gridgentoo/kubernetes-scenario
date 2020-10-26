На этом шаге вы создадите **container image**, который инкапсулирует ваше приложение.

## Напишим **Dockerfile**

**Dockerfile** описывает шаги, которые **Docker** предпримет для создания вашего **container image**.

<pre class="file" data-filename="Dockerfile" data-target="replace">
# Start with the scratch (empty) image
FROM scratch

# Copy the hello binary into the root directory
COPY hello /

# Tell Docker what executable to run by default when starting this container
ENTRYPOINT ["/hello"]
</pre>

## Создайте **container image** из этого **Dockerfile**.

Следующая команда создает **container image**, следуя командам в **Dockerfile**.

`docker build -t hello  .`{{execute}}

* С опцией **`-t`** мы даем этому **image** имя **`hello`**. (Подробнее об именах **image** и тегах см. В примечаниях ниже.)
* **`.`** означает, что мы создаем изображение в контексте текущего каталога.

Убедитесь, что образ контейнера **image** существует.

`docker image ls`{{execute}}

Вы должны увидеть в списке несколько **container images**, в том числе один под названием *hello*.

Ваше изображение имеет тег *latest*. Это значение по умолчанию, если вы не указываете тег.
Вы могли бы явно указать это с помощью **`-t hello:latest`**, и результат будет идентичным.

## Следующий шаг

У вас есть **container image**! На следующем шаге мы запустим контейнер на основе этого **image**. 
Прежде чем мы это сделаем, если вы хотите узнать больше о том, как идентифицируются **container images**, вот несколько дополнительных материалов для чтения и ресурсов.

### Примечания и дальнейшее чтение

Когда вы загружаете и отправляете **pushing images** из реестров контейнеров **container registries** (например, Docker Hub)
Вы можете ссылаться на свое **image** несколькими способами:

* \[*registry*/\]*repository*/*name*:*tag*
* \[*registry*/\]*repository*/*name*@sha256:*image digest*

**registry** - это имя хоста реестра контейнеров **container registry**. Если он не указан, предполагается, что вы имеете в виду **Docker Hub**. 
Реестр становится важным только при отправке и извлечении **images** в **registry** и из него.

**repository**  - это обычно ваш **username** или название вашей организации или проекта. 
Это еще одно поле **field**, которое действительно вступает в игру только тогда, когда вы используете **images**, хранящиеся в реестре. 
Есть набор **"standard images"**, у которых нет имени репозитория (например, **`nginx`** или **`ubuntu`**).

**name** - это имя **image** - в нашем случае мы использовали `hello`.

**image digest** - это хэш содержимого **image contents**, и это неизменный идентификатор для этой точной версии **image**. 
Если вы перестроите образ **image**, у него будет другой хэш **hash**.

**image digest** и **tag**- это оба способа идентификации версий одного и того же **image**. Дайджест уникален для конкретного **image**, но вы можете присвоить любому **image** любой тег, который вам нравится. Один и тот же тег может использоваться повторно для обозначения разных версий **image**. Кроме того, данное **image** может иметь любое количество различных тегов.

На практике теги часто используются для хранения семантических номеров версий. Например, если самая последняя версия определенного компонента - версия 2.1.3, то же **image** может иметь теги «2», «2.1», «2.1.3» и «latest». Если кто-то извлечет версию без указания тега, он получит эту версию, потому что тег по умолчанию имеет значение **"latest"**.

Подробнее об идентификаторах **image IDs** и тегах:

* [Explaining Docker Image IDs](https://windsock.io/explaining-docker-image-ids/)
* [Docker Tag vs Hash: A Lesson in Deterministic Ops](https://medium.com/@tariq.m.islam/container-deployments-a-lesson-in-deterministic-ops-a4a467b14a03)
* [Using Docker tags to mess with people's minds](https://medium.com/microscaling-systems/using-docker-tags-to-mess-with-peoples-minds-367bb2c93bd0)
