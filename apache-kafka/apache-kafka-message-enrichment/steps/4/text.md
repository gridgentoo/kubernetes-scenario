Open a file called GeoIPService.java in the src/main/java/monedero/extractors directory containing the content:

```
package monedero.extractors;
import com.maxmind.geoip.Location;
import com.maxmind.geoip.LookupService;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
public final class GeoIPService {
  private static final String MAXMINDDB = "/path_to_your_GeoLiteCity.dat_file";
  public Location getLocation(String ipAddress) {
    try {
      final LookupService maxmind = 
        new LookupService(MAXMINDDB, LookupService.GEOIP_MEMORY_CACHE);
      return maxmind.getLocation(ipAddress);
    } catch (IOException ex) {
      Logger.getLogger(GeoIPService.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }
}
```

The GeoIPService has a public method getLocation that receives a string representing the IP address and looks for this IP address in the GeoIP location database. This method returns an object of class location with the geographic location of that specific IP address.