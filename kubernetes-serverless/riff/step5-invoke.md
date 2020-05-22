The Square function can be invoked from the Riff CLI. Ask Riff to reveal the curl syntax for the Square function.

`riff service invoke square --text -- -w '\n' -d 8`{{execute}}

Invoke the function.

`$(riff service invoke square --text -- -w '\n' -d 8)`{{execute}}

As a function it will return 64, the square of the 8 passed in.
