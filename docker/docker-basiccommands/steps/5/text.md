We ran an ubuntu container on an Linux host. They have different, independent packages. Installing something on the container doesn't expose it to the host.

# Task

Run `exit`{{execute}} to exit the container.

Now try to run `figlet hello`{{execute}} on the host machine. Does that work?

**Note:** The above command will not work except if, by coincidence, you are running on a machine where figlet was installed before.)