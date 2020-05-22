While this scenario focuses on writing a Kubernetes Operator, its topic for demonstration is the old and trustworthy `at` command.

> If you are already familiar with that 'at' command, you can skip this step.

This `at` command is available on a variety of operating system, including this Linux instance you have in front of you. To understand its purpose, let's see how it works.

## Install at

First, install the utility using the standard `apt` package manager.

`apt-get install at --yes -qq`{{execute}}

Verify the utility now responds.

`at -V`{{execute}}

## Schedule an at Job

There is a file already in the current directory. Click on this file `at-example.txt`{{open}} link to view it in the editor.

The `at` command accepts two declarations.

1. A future time when one or more commands should run.
2. A source of one or more commands to run at the future time.

This allows you to schedule a set of activities (also termed a job or batch) at a later date.

> This is not to be confused with a Kubernetes Jobs or Cron Jobs, but it's generally the same concept.

Schedule the at-test.txt commands to run at in a minute. Minutes are the smallest units.

`at -M -v -f at-example.txt 'now + 1 minute'`{{execute}}

# Observe Results

Within a minute there will be a new file.

`watch cat /tmp/at-example-result.txt`{{execute}}

When the future tasks runs a new file appears and you see the echoed message. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>. Now you understand how `at` works. In the rest of this scenario, you will use this concept for creating an `at` like Operator on Kubernetes.
