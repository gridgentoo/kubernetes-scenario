Now, let's open a file in **vscode** explorer called OpenExchangeService.java in the src/main/java/monedero/extractorsdirectory with the content:

```
package monedero.extractors;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
public final class OpenExchangeService {
  private static final String API_KEY = "YOUR_API_KEY_VALUE_HERE";  //1
  private static final ObjectMapper MAPPER = new ObjectMapper();
  public double getPrice(String currency) {
    try {
      final URL url = new URL("https://openexchangerates.org/api/latest.json?app_id=" + API_KEY);  //2
      final JsonNode root = MAPPER.readTree(url);
      final JsonNode node = root.path("rates").path(currency);   //3
      return Double.parseDouble(node.toString());                //4
    } catch (IOException ex) {
   Logger.getLogger(OpenExchangeService.class.getName()).log(Level.SEVERE, null, ex);
    }
    return 0;
  }
}
```

Some lines of the OpenExchangeService class can be analyzed as follows:

- In line `//1`, the value of the API_KEY is assigned when you registered in the open exchange rates page; the free plan gives you up to 1,000 requests per month.
- In line //2`, our class invokes the open exchange API URL, using your API_KEY. To check the prices at the moment, you can access the URL (counts as a request with your key): https://openexchangerates.org/api/latest.json?app_id=YOUR_API_KEY.    
- In line `//3`, the currency string passed as argument is searched in the JSON tree that returns the web page.
- In line `//4`, the currency price (in US dollars) of the currency passed as an argument is returned as a double value.
 