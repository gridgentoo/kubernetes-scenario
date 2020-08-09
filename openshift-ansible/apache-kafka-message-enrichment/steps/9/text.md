The customer consults the ETH price event, starts in the client's web browser, and is dispatched to Kafka through some HTTP event collector. The second step is to enrich the message with the currency price from open exchange rates service.

In summary, here are the architecture steps for the Monedero processing engine:

- Read the individual events from a Kafka topic called input-messages
- Validate the message, sending any defective event to a specific Kafka topic called invalid-messages
- Enrich the message with the currency price from open exchange rates service
- Write the enriched messages in a Kafka topic called valid-messages

The final version of the stream processing engine is detailed in Figure 3.2:

![](https://github.com/fenago/katacoda-scenarios/raw/master/apache-kafka/apache-kafka-message-enrichment/steps/9/1.png)

The processing engine reads the messages from the input-messages topic, validates the messages, routes the defective ones to invalid-messages queue, enriches the messages with geographic location and price, and finally, writes them to valid-messages queue.