Blog post: https://medium.com/@alessandro.demaria/adb6a488cd77

Let's remove the `features.brine` feature from the `dev-sea` environment.

`sed -i '/features.brine/d' inventory/targets/dev-sea.yml`{{execute}}
`kapitan compile`{{execute}}

`git status`{{execute}}
