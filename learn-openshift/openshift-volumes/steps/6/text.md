To create an interactive shell within the same container running the application, you can use the ``oc rsh`` command, by providing the name of the pod.
``oc rsh mypod``{{execute HOST1}}

From within the interactive shell, set directory to ``cd /logs``{{execute HOST1}}

Run this command to create text file inside volume `echo "This file will be persisted" > log.txt`{{execute}}

Run `exit`{{execute}} to exit the pod.

Verify `log.txt` exists at host path by running ``cat /data/volume1/log.txt``{{execute HOST1}}.

# Protip
You can also run ``oc describe pod mypod``{{execute HOST1}} to verify volume was mounted successfully.


