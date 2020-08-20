Edit `com/redhat/cloudnative/inventory/InventoryResource.java` add replace the code with 
the following in order to return a zero inventory for products that don't exist in the inventory 
database.

<pre class="file" data-filename="./src/main/java/com/redhat/cloudnative/inventory/InventoryResource.java" data-target="replace">
package com.redhat.cloudnative.inventory;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.wildfly.swarm.health.Health;
import org.wildfly.swarm.health.HealthStatus;
import java.util.Date;

@Path("/")
@ApplicationScoped
public class InventoryResource {
    @PersistenceContext(unitName = "InventoryPU")
    private EntityManager em;

    @GET
    @Path("/api/inventory/{itemId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Inventory getAvailability(@PathParam("itemId") String itemId) {
        Inventory inventory = em.find(Inventory.class, itemId);

        if (inventory == null) {
            inventory = new Inventory();
            inventory.setItemId(itemId);
            inventory.setQuantity(0);
        }

        return inventory;
    }
}
</pre>