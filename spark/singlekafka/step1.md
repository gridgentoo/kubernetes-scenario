
# Install kafka

Let's use kafka's quick start
https://kafka.apache.org/quickstart

download kafka at
https://www.apache.org/dyn/closer.cgi?path=/kafka/2.4.0/kafka_2.12-2.4.0.tgz

`wget http://apache.mirror.anlx.net/kafka/2.4.0/kafka_2.12-2.4.0.tgz`{{execute}}



`tar -xzf kafka_2.12-2.4.0.tgz`{{execute}}

`cd kafka_2.12-2.4.0`{{execute}}


## Start the server and create a topic

start zookeeper, then kafka

`bin/zookeeper-server-start.sh config/zookeeper.properties &`{{execute}}

`bin/kafka-server-start.sh config/server.properties &`{{execute}}

Create a topic

`bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test`{{execute}}

confirm the topic is created:{{execute}}
`bin/kafka-topics.sh --list --bootstrap-server localhost:9092`

