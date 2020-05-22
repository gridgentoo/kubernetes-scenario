## Access ##

Katacoda has exposed the NodePort 31000 to access Kibana from your browser. 

[Access Kibana](https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/). There is also a tab above the command-line area labeled `Kibana` that takes you to the same Kibana portal.

## Security ##

> **_Tip:_** There are no credentials to access this EFK stack through Kibana. For real deployments, you would _never_ expose this type of information without at least an authentication wall. Logs typically reveal lots of dirty laundry and attack vector opportunities.

## Portal ##

To see the logs collected from the random-logger service follow these steps in the Kibana portal.

1. When Kibana appears for the first time there will be a brief animation while it initializes.
1. On the Welcome page click **_Explore on my own_**.
1. From the left-hand menu select the top **_Discover_** item.
1. Click on the button **_Create index pattern_** on the top.
1. In the form field _Index pattern_ enter `kubernetes_cluster-*`{{copy}}
1. It should read "Success!" and Click the **_> Next step_** button on the right.
1. In the next form, from the dropdown labeled _Time Filter field name_, select **_@timestamp_**.
1. From the bottom-right of the form select **_Create index pattern_**.
1. In a moment a list of fields will appear.
1. Again, from the left-hand menu select the top **_Discover_** item.
1. The log list will appear.
1. Refine the list a bit by selecting **_log_** near the bottom the left-hand _Selected fields_ list.
1. When you hover over or click on the word _log_, click the **_Add_** button to the right of the label.

The log list now is filtered to show log events from the random-logger service. You can expand each event to reveal further details.

From here you can start to appreciate the amount of information this stack provides. More information is in the [Kibana documentation](https://www.elastic.co/guide/en/kibana/current/getting-started.html).
