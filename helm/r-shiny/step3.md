Provisioning a Shiny application that generates a word cloud is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31112.

`kubectl create -f shiny-wordcloud.yaml`{{execute}}

The Shiny server takes about a minute to start. Watch the Deployment _AVAILABLE_ state change from _0_ to _1_. To get a complete status of the deployment availability run this inspection.

`watch kubectl get deployments,pods,services`{{execute}}

After a minute or so the Pod will move to the _running_ state and the Deployments will move to the _available (1)_ state. Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

In Katacoda, you can access the application in your browser from the "Shiny Wordcloud" tab above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/. If the Nginx default page appears, the means the application is still initializing. Try the same URL again in a minute.
