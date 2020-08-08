
Now, let's open a file in **vscode** explorer called Enricher.java in the src/main/java/monedero/directory with the content:

```
package monedero;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.maxmind.geoip.Location;
import monedero.extractors.GeoIPService;
import org.apache.kafka.clients.producer.KafkaProducer;
import java.io.IOException;

public final class Enricher implements Producer {
  private final KafkaProducer<String, String> producer;
  private final String validMessages;
  private final String invalidMessages;
  private static final ObjectMapper MAPPER = new ObjectMapper();
  public Enricher(String servers, String validMessages, String 
    invalidMessages) {
    this.producer = new KafkaProducer<> 
    (Producer.createConfig(servers));
    this.validMessages = validMessages;
    this.invalidMessages = invalidMessages;
  }
  @Override
  public void process(String message) {
    try {
      // this method below is filled below  
    } catch (IOException e) {
      Producer.write(this.producer, this.invalidMessages, "{\"error\": \""
          + e.getClass().getSimpleName() + ": " + e.getMessage() + "\"}");
    }
  }
}
```

As expected, the Enricher class implements the producer interface; therefore the Enricher is a producer.

Let's fill the code of the process() method.

If the customer message does not have an IP address, the message is automatically sent to invalid-messages topic, as follows:

```
      final JsonNode root = MAPPER.readTree(message);
      final JsonNode ipAddressNode =   
        root.path("customer").path("ipAddress");
      if (ipAddressNode.isMissingNode()) {
        Producer.write(this.producer, this.invalidMessages,
            "{\"error\": \"customer.ipAddress is missing\"}");
      } else {
        final String ipAddress = ipAddressNode.textValue();
```

The Enricher class invokes the getLocationmethod of GeoIPService , as follows:

```
final Location location = new GeoIPService().getLocation(ipAddress);
 

 

The country and the city of the location are added to the customer message, as in the example:

```
        ((ObjectNode) root).with("customer").put("country",  
             location.countryName); 
        ((ObjectNode) root).with("customer").put("city", 
             location.city);
```
The enriched message is written to the valid-messages queue, as follows:

```
        Producer.write(this.producer, this.validMessages, 
           MAPPER.writeValueAsString(root));
    }
```

Note that the location object brings more interesting data; for this example, just the city and the country are extracted. For example, the MaxMind database can give us much more precision than the one exploited in this example. In effect, the online API can accurately show the exact location of an IP.

Also note that here we have a very simple validation. In the next chapter, we will see how to validate the schema correctness. For the moment, think of other validations that are missing to have a system that meets the business requirements.