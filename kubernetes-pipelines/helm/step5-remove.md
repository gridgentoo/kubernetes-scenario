Now that Redis is running, take it back down. After all, these installations should not be precious [snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html).

`helm delete my-redis`{{execute}}

No matter how complex the chart, the delete command will undo everything the install provisioned.

Next, explore the wealth of charts available.
