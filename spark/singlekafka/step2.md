# Send msg's

#### Step 4: Send some messages

Kafka comes with a command line client that will take input from a file or from standard input and send it out as messages to the Kafka cluster. By default, each line will be sent as a separate message.   

Run the producer and then type a few messages into the console to send to the server.

ctrl-c to exit   

`bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test`{{execute}}   
This is a message   
This is another message   


#### Step 5: Start a consumer

Kafka also has a command line consumer that will dump out messages to standard output, it should return the lines you typed in.   


`bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning`{{execute}}