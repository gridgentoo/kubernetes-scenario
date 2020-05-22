Without any scaling logic applied we can apply stress to the single instance PHP application that is now running. In a second terminal this step will run two commands. First, shell into a new busybox Pod.

`kubectl run -i --tty load-generator --image=busybox /bin/sh`{{execute T2}}

Hit enter for command prompt. Exercise the service in a loop.

`while true; do wget -q -O- http://php-apache.default.svc.cluster.local; done`{{execute T2}}

With the loop running the service continue to respond with `OK!`. This is just one Pod that is serving handling all these requests. In the next step let's add some scaling rules.
