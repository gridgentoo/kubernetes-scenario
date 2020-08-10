Blog post: https://medium.com/@alessandro.demaria/adb6a488cd77

Let's remove the `components.tuna` component from the `dev-sea` environment.

`sed -i '/components.tuna/d' inventory/targets/dev-sea.yml`{{execute}}
`kapitan compile`{{execute}}

`git status`{{execute}}


PLEASE REFER TO THE BLOG POST FOR FURTHER INSTRUCTIONS
