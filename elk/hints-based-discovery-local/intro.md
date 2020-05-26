### Welcome

To monitor an application running in Kubernetes (k8s), you need logs and metrics from the app, as well as, the k8s environment it's running in. Using Elasticsearch, Kibana, and Beats allows you to collect, search, analyze and visualize all of this data about the app and the k8s (pods, containers, etc) in one place. 

### Let's take a look at the goal
This is one of the out of the box dashboards that you will see once you deploy the sample applications and the Beats (Elastic's lightweight shippers for logs, metrics, etc.) in this Katacoda environment and connect the Beats to the Elasticsearch Service in Elastic Cloud.  This is the Docker metrics dashboard that ships with Metricbeat.  It shows an overview of the CPU and Memory use of every container, allows you to drill in to a specific container, and the containers per node.  Looking at the dashboard is much easier than running the equivalent kubectl logs, events, top, describe, etc. commands.

![Docker Dash](https://user-images.githubusercontent.com/25182304/44353691-c2bb8c00-a475-11e8-8d0e-9578c5c8cc47.png)

### This is an example of annotations to specify what Beat module to use:
![apache2 module hint](https://user-images.githubusercontent.com/25182304/44863869-50546400-ac4c-11e8-892d-5575af08a724.png)

### This is a hint for specifying multiline parsing rule for an unknown log type:
![Spring multiline hint](https://user-images.githubusercontent.com/25182304/44864163-f86a2d00-ac4c-11e8-874c-ae01eae43864.png)

### Before you hit start
This scenario depends on having Elasticsearch and Kibana available.  The instructions call for an instance of Elasticsearch Service in Elastic Cloud.  Deploy Elasticsearch Service before starting the scenario.

### Create an Elastic Cloud deployment
You can use Elasticsearch Service in Elastic Cloud ( http://cloud.elastic.co ), or a local deployment, or deploy containers from https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

If this is your first experience with the Elastic stack I would recommend Elastic Cloud; and don't worry, you do not need a credit card.

Make sure that you take note of the CLOUD ID and Elastic Password if you use Elastic Cloud or Elastic Cloud Enterprise.

### A Quick Katacoda Primer
If this is your first time using Katacoda, let me introduce some of the cool ideas:

* In general, you don't need to type.  Most of the time, you can simply click on a command in the instructions to run it.
* If you need access to a web browser, look for tabs at the top of the terminal window. In this course you will need two pages - one for the Guestbook application, and one for  Kibana. You should see a *Guestbook* tab and a *Kibana* tab in the terminal.  Once you have the Guestbook app running, click on the *Guestbook* tab to open it in a browser window and make some entries. Likewise, once you have Kibana running you should open that tab and look at the data.
* Each time you start or restart a course everything gets reset. If you misconfigure something somehow, simply restart the course.

