Now that the final version of the Enricher class is coded, we have to compile and execute it.

As we know, the ProcessingEngine class contains the main method to coordinate the reader and writer classes. Now, let's modify the ProcessingEngine.java file on the src/main/java/monedero/directory and replace Validator with Enricher as in the highlighted code:

```
package monedero;
public class ProcessingEngine {
  public static void main(String[] args){
    String servers = args[0];
    String groupId = args[1];
    String sourceTopic = args[2];
    String validTopic = args[3];
    String invalidTopic = args[4];
    Reader reader = new Reader(servers, groupId, sourceTopic);
    Enricher enricher = new Enricher(servers, validTopic, invalidTopic);
    reader.run(enricher);
  }
}
```

The processing engine receives the following five arguments from the command line:

- **args[0]:** servers, indicates the host and port of the Kafka broker
- **args[1]:** groupId, indicates that the consumer is part of this Kafka consumer group
- **args[2]:** inputTopic, the topic where Reader reads from
- **args[3]:** validTopic, the topic where valid messages are sent
- **args[4]:** invalidTopic, the topic where invalid messages are sent
