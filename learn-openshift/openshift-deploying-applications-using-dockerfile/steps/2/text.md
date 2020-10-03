For this lab, we are going to use the redis container. First, we need a Dockerfile with additional files located at   https://github.com/docker-library/redis.git. Let's clone this repository locally to understand its structure:
`git clone https://github.com/docker-library/redis.git`{{execute}}

```
Cloning into 'redis'...
remote: Counting objects: 738, done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 738 (delta 7), reused 13 (delta 4), pack-reused 719
Receiving objects: 100% (738/738), 108.56 KiB | 0 bytes/s, done.
Resolving deltas: 100% (323/323), done.
```

The repository contains a number of directories representing a particular version of Redis:
`tree redis/`{{execute}}

The repository structure contains a number of directories representing a particular version. To build the application, we need to specify a directory that contains the required Dockerfile. This can be achieved by using the --context-dir option of oc new-ap. This will be described later.