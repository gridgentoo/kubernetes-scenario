from("timer:tick?period=3s")
  .setBody().constant("G'day and hello world from Camel K!!!")
  .to("log:message")