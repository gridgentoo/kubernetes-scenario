
## Существует множество полезных команд **Linux** для предоставления вам информации о контейнерах **Linux**. Здесь только несколько.


#######################################################
lsof (от англ. LiSt of Open Files) — утилита, служащая для вывода информации о том, какие файлы используются теми или иными процессами.

нажмите ```clear```{{execute interrupt}} 

`kubectl exec $POD --container random-logger -- lsof`{{execute}}

Информация предоставляется в виде колонок, в которых отображается информация:

COMMAND   — имя процесса;
PID — его Process ID;
USER — имя пользователя, запустившего процесс;
FD — номер файлового дескриптора, либо обозначение типа:

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
