

`wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb`{{execute}}

`apt install ./dive_0.9.2_linux_amd64.deb`{{execute}}

docker run --rm -it -v $PWD:/src -e VERSION=0.69.0 -u hugo orus/hugo-builder new site dijure.com