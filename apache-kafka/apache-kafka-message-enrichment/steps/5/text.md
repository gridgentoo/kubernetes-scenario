The customer consults the ETH price in the client's browser and is sent to Kafka through some HTTP event collector.

The first step in our flow is the event correctness validation. The messages with defects are derived from bad data and that is why they are filtered. The second step now is to enrich our message with geographic location information.

Here are the architecture steps for the Monedero processing engine:

- Read the individual events from a Kafka topic called input-messages
- Validate the message, sending any defective event to a dedicated Kafka topic called invalid-messages
- Enrich the message with the geographic location data
- Write the enriched messages in a Kafka topic called valid-messages

All of these steps of the second version of the stream processing engine are shown below:

![](https://github.com/fenago/katacoda-scenarios/raw/master/apache-kafka/apache-kafka-message-enrichment/steps/5/1.png)
	
The processing engine reads the events from the input-messages topic, validates the messages, sends the errors to invalid-messages topic, enriches the messages with geographic location, and then writes them to the valid-messages topic.
