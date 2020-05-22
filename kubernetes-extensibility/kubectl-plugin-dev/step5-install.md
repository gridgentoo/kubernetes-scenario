Another make task will build the application as a plugin for `kubectl`.

`make cli-install`{{execute}}

The plugin binary is now in the Go bin directory.

`ls $GOPATH/bin`{{execute}}

Because this directory is in your `$PATH`, this is now a plugin available for `kubectl`.

`kubectl example version`{{execute}}
