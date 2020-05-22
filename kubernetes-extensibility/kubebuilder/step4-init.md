Kubebuild requires Go 1.13+. Ensure we have a good version as a prerequisite.

`go version`{{execute}}

Create a Go project directory for your new controller.

`export GO111MODULE=on`{{execute}}

`mkdir -p $GOPATH/src/example; cd $GOPATH/src/example`{{execute}}

Kubebuild has an init command that creates a local directory populated with the skeleton to start writing your Operator.

`kubebuilder init --domain my.domain`{{execute}}

It will take a few moments to download and cache the dependencies. As it runs, explore the files in the `example` directory found in the file tree to the right of this text.
