Pull down the Redis container image.

`docker pull redis`{{execute}}

Create a scratch location to inspect the Redis files.

`mkdir redis && cd redis`{{execute}}

Same the image locally to a tar file.

`docker save --output redis.tar redis`{{execute}}
