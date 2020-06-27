
### Существует множество полезных команд **Linux** для предоставления вам информации о контейнерах **Linux**. Здесь только несколько.

lsof (от англ. LiSt of Open Files) — утилита, служащая для вывода информации о том, какие файлы используются теми или иными процессами.

Утилита **lsof** (её название звучит как **el-soff**, хотя некоторым больше нравится нечто вроде **liss-off** или даже **el-es-o-eff**) — это невероятно полезная команда, которая выводит список всех открытых файлов (**LiSts all Open Files**).

нажмите ```clear```{{execute interrupt}} 

`kubectl exec $POD --container random-logger -- lsof`{{execute}}

Опция -c позволяет вывести сведения о файлах, которые держат открытыми процессы, выполняющие команды, имена которых начинаются с заданных символов. Например, вот какая команда позволит увидеть первые 3 файлов, открытых всеми процессами Python, выполняющимися на компьютере. **lsof -cpython | head -3**

`kubectl exec $POD --container random-logger -- lsof -cpython | head -3`{{execute}}

Опция -U позволяет вывести все файлы сокетов домена Unix. **lsof -U | head -3**

`kubectl exec $POD --container random-logger -- lsof -U | head -3`{{execute}}

**lsof** (сокр. **LiSt Open Files**) при определенной сноровке позволяет строить графы взаимосвязей между запущенными системами, кто какие файлы использует, кто с кем по каким протоколом общается. 

**lsof** ключ **-F**, который позволяет выводить информацию не в виде таблицы, а в виде последовательности отдельных строк, которые можно перенаправить на вход другой программы для дальнейшей обработки.

[lsofgraph](https://github.com/zevv/lsofgraph) был написан, как раз под этот -F, парсить такой вывод гораздо удобнее чем табличный вывод. К сожалению, lsofgraph был написан на Lua, а она не везде стоит, так что был переписан на python: [lsofgraph-python](https://github.com/akme/lsofgraph-python)

Более подробно про lsofgraph-python можно почитать на Хабре [Визуализация связей процессов в Linux](https://habr.com/ru/post/353322/)

#######################################################

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/K1gEh-tUC4E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**5.8.3. inode и команда stat.mp4**

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/Ceb2B3ZRHrs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**5.8.4. Как увидеть номер inode и (ls  -li)**

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/TPL4Zl7Fjv4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**5.8.5. Утилита df (-i).mp4**

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/Y8j_TWOHPqg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**5.8.6. Подведем итоги inode.mp4**

#######################################################

нажмите ```clear```{{execute interrupt}} 

`kubectl exec $POD --container random-logger -- iostat`{{execute}}

нажмите ```clear```{{execute interrupt}} 

`kubectl exec $POD -- uptime`{{execute}}

нажмите ```clear```{{execute interrupt}} 

`kubectl exec $POD -- ps`{{execute}}

нажмите ```clear```{{execute interrupt}} 

`kubectl exec $POD -- stat -f /`{{execute}}

#######################################################


Когда **Pod** имеет более одного контейнера, может быть указано конкретное имя контейнера.

`kubectl exec $POD --container random-logger -- ls -a -l`{{execute}}
