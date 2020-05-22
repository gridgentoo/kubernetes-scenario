To start writing a kubectl plugin, it's best to start with a skeleton source where you can readily start adding code for the various commands.

[**Ken Sipe**]([Ken Sipe](https://www.linkedin.com/in/kensipe/) created the origin of the scenario and has provided a helpful skeleton for you to get started. Clone the source code to this scenario's local directory.

`git clone https://github.com/codementor/k8s-cli && cd k8s-cli`{{execute}}

Inspect the source.

`tree`{{execute}}

> If the tree command reports `The program 'tree' is currently not installed.` then this specific instance of Katacoda did not start correctly. This is a known issue that occasionally appears. Simply restart this scenario to get a new, and hopefully correct Katacoda instance and return here.

You can also browse and the files by selecting files in the directory list and code editor above the command line. In the following steps, you will be using the editor and copy/paste features to modify this skeleton code.
