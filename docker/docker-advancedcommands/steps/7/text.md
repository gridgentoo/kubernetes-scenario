Just like with the standard UNIX command tail -f, we can follow the logs of our
container:

`docker logs --tail 1 --follow mycontainer`{{execute}}

## Output
> Sat Aug  3 11:43:28 UTC 2019
> Sat Aug  3 11:43:29 UTC 2019

- This will display the last line in the log file.
- Then, it will continue to display the logs in real time.
- Use ^C to exit.