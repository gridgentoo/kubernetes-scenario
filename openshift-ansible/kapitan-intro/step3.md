Blog post: https://medium.com/@alessandro.demaria/adb6a488cd77

This example will show you how to work with multiple environments. It comes with 2 environments: `prod-sea` and `dev-sea`. 

You can run `kapitan compile`{{execute}} to verify that the compilation works

***kapitan*** compilation is an idempotent operation. If none of the inputs have changed, you can expect no changes in the compiled files.

In fact, let's verify that the `git status`{{execute}} is clean
