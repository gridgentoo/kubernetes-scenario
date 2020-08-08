
In the **first** command-line terminal, go to the Kafka installation directory and generate the two necessary topics, as follows:

`~/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic valid-messages`{{execute T1}} 

`~/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic invalid-messages`{{execute T1}} 

Then, start a console producer to the input-topic topic, as follows:


`~/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic input-topic`{{execute T1}} 

This window is where the input messages are produced (typed).


