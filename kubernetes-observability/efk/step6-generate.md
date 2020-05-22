Run this container to start generating random log events.

`kubectl run random-logger --image=chentex/random-logger --generator=run-pod/v1`{{execute}}

> Thank you to Vicente Zepeda for providing this [beautifully simple container](https://github.com/chentex/random-logger).

The log events will look something like this.

```
...
2019-03-27T11:06:25+0000 INFO takes the value and converts it to string.
2019-03-27T11:06:29+0000 DEBUG first loop completed.
2019-03-27T11:06:31+0000 ERROR something happened in this execution.
2019-03-27T11:06:46+0000 WARN variable not in use.
...
```

Inspect the actual log events now being generated with this log command.

`kubectl logs pod/random-logger`{{execute}}

Don't be alarmed by the messages, these are just samples.
