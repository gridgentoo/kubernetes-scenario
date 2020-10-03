
Now, let's see what happens if we try to create one more pod. Prepare a new pod definition from the one used to create the first pod by replacing nginx with httpd:

The oc new-app command takes a number of parameters, allowing you to modify the deployment process according to your needs. For example, you may need to modify names, specify environment variables, and so on.

Advanced options can always be displayed by using the built-in help function, which can be displayed by oc new-app --help:


`oc new-app --help`{{execute}}

Create a new application by specifying source code, templates, and/or images


If you provide source code, a new build will be automatically triggered. You can use 'oc status' to
check the progress.

```
Usage:
  oc new-app (IMAGE | IMAGESTREAM | TEMPLATE | PATH | URL ...) [options]

Examples:
  # List all local templates and image streams that can be used to create an app
  oc new-app --list

  # Create an application based on the source code in the current git repository (with a public
remote)
  # and a Docker image
  oc new-app . --docker-image=repo/langimage
```
