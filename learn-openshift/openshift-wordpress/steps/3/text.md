WordPress is a free and open-source Content Management System (CMS) based on PHP and MySQL. We want to demonstrate the Source-to-Image (S2I) build process for WordPress using templates. The following repository contains ready-to-use templates for deploying WordPress on an OpenShift cluster. There are two example templates available in the repository. Let's clone the repository first:
`git clone https://github.com/athertahir/wordpress-quickstart.git`{{execute}}

```
Cloning into 'wordpress-quickstart'...
remote: Counting objects: 331, done.
remote: Total 331 (delta 0), reused 0 (delta 0), pack-reused 331
Receiving objects: 100% (331/331), 1.07 MiB | 1.96 MiB/s, done.
Resolving deltas: 100% (119/119), done.
```

We are going to apply the wordpress-quickstart `classic-standalone.json` WordPress template.