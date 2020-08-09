To add the open exchange rates service to our engine, modify the Enricher.java file in the src/main/java/monedero/directory with the changes highlighted below:

```
package monedero;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.maxmind.geoip.Location;
import monedero.extractors.GeoIPService;
import monedero.extractors.OpenExchangeService; //1
import org.apache.kafka.clients.producer.KafkaProducer;
import java.io.IOException;
public final class Enricher implements Producer {
  private final KafkaProducer<String, String> producer;
  private final String validMessages;
  private final String invalidMessages;
  private static final ObjectMapper MAPPER = new ObjectMapper();
  public Enricher(String servers, String validMessages, String invalidMessages) {
    this.producer = new KafkaProducer<>(Producer.createConfig(servers));
    this.validMessages = validMessages;
    this.invalidMessages = invalidMessages;
  }
  @Override
  public void process(String message) {
    try {
      final JsonNode root = MAPPER.readTree(message);
      final JsonNode ipAddressNode = root.path("customer").path("ipAddress");
      if (ipAddressNode.isMissingNode()) { //2
        Producer.write(this.producer, this.invalidMessages,
           "{\"error\": \"customer.ipAddress is missing\"}");
      } else {
        final String ipAddress = ipAddressNode.textValue();
        final Location location = new GeoIPService().getLocation(ipAddress);
        ((ObjectNode) root).with("customer").put("country", location.countryName);
        ((ObjectNode) root).with("customer").put("city", location.city);
        final OpenExchangeService oes = new OpenExchangeService(); //3
        ((ObjectNode) root).with("currency").put("rate", oes.getPrice("BTC"));//4
        Producer.write(this.producer, this.validMessages, MAPPER.writeValueAsString(root)); //5
      }
    } catch (IOException e) {
      Producer.write(this.producer, this.invalidMessages, "{\"error\": \""
          + e.getClass().getSimpleName() + ": " + e.getMessage() + "\"}");
    }
  }
}
```

As we know, the Enricher class is a Kafka producer, so now let's analyze the additions:

- In line `//1`, we import OpenExchangeService built previously
- In line `//2`, to avoid later null pointer exceptions, if the message does not have a valid IP Address on customer, the message automatically is sent to the invalid-messages queue
- In line `//3`, generates an instance of the OpenExchangeService class that is an extractor
- In line `//4`, the getPrice() method of the OpenExchangeService class is called, and this value is added to the message: the price of the currency is added to the currency node in the leaf price
- In line `//5`, the enriched message is written to the valid-messages queue
This is the final version of the enricher engine for Monedero; as we can see, the pipeline architecture uses the extractors as input for the enricher. Next, we will see how to run our entire project.

 

Note that the JSON response has a lot of more information, but for this example, only one currency price is used. There are several open data initiatives that are free and provide a lot of free repositories with online and historical data.