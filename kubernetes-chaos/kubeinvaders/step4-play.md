Start playing the game and try to kill some alien Pods. Just above the command-line there is a tab labeled _Play KubeInvaders_, or you can click on this [link](https://[[HOST_SUBDOMAIN]]-30016-[[KATACODA_HOST]].environments.katacoda.com).

As aliens are killed, come back to the watch in the terminal and see how Kubernetes is repairing the Pods.

`watch kubectl get deployments,pods --all-namespaces -l app-purpose=chaos`{{execute}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Game Play Keys

| Input       | Action                                           |
|-------------|--------------------------------------------------|
|     space   | Fire! Apply chaos.                               |
|     arrows  | Move you chaos ship and aim.                     |
|     n       | Change namespace.                                |
|     a       | Switch to automatic mode.                        |
|     m       | Switch to manual mode.                           |
|     h       | Show special keys.                               |
|     q       | Hide help for special keys.                      |
|     i       | Show pod's name. Move the ship towards an alien. |

Enjoy!
