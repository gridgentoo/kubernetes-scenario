In this first part, we’ll create a new worker node/agent to use to execute our pipeline. Then, we’ll add the basic node block to use it. (Note that you wouldn’t normally create a node/agent on the same machine as the master but we’ll do this here for simplicity.)

You probably want to check out the container. If so, do a `docker ps` and get the id of your container image:

![image](https://user-images.githubusercontent.com/558905/37946707-cfeaa10c-3154-11e8-99ba-c84bfc1a5d06.png)

`docker ps`{{execute}}

And then at the terminal, do a:

`docker exec -it b36 /bin/bash`{{execute}}

were `b36` is the first few letters of **your** container id.

You should now be `root` inside your container.

----

Now go to the Dashboard (right of the Terminal) and start it up as `8080`. It may take a little before you are able to login.

Click on the **Manage Jenkins** link in the menu on the left-hand side. Next, look in the list of selections in
the middle of the screen, and find and click on **Manage Nodes**. (You may need to scroll down.)

![image001](https://user-images.githubusercontent.com/558905/37634630-e1a84142-2bcd-11e8-9ead-3f185a6e8a17.jpg)

On the next screen, notice that we already have several nodes listed here, including master and two worker nodes. Now, we’re going to create a new worker node to use in our pipeline.

Click on **New Node** on the menu on the left-hand side.

![image003](https://user-images.githubusercontent.com/558905/37634631-e1b4d240-2bcd-11e8-8150-db4205da8a8c.jpg)

For **Node name**, type in `worker_node1`.

Click on the **Permanent Agent** radio button. Then click on “OK”.


You should now be on the configuration screen for the new node.

For **Description**, you can enter “Main pipeline worker node” (or whatever you wish).
Set the **# of executors** to 2.

In the **Remote root directory** field, enter `/home/jenkins2/worker_node1`. This is the working area for the node. For **Labels** enter “worker_node1 docker”. These are identifiers that can be used in the pipeline to refer to the node.

For **Launch method**, click the down arrow at the far right, and select **Launch slave agents via SSH**. This will use SSH
keys to launch the nodes.

* Under Launch method, for **Host**, enter “diyvb2”.
* Under Launch method, for **Credentials**, click the drop-down arrow, and select **jenkins 2 (Jenkins 2 SSH)**. These are SSH credentials that have already been setup on the system.
* Under Launch method, for **Host Key Verification Strategy**, click the drop-down arrow, and select **Non verifying Verification Strategy**. We’re using this less secure strategy here to keep things simple.

![image007](https://user-images.githubusercontent.com/558905/37634632-e1c1987c-2bcd-11e8-91ca-b74fa99d387e.png)

Leave everything else the same, and click Save (at the bottom of the page). You’ll now be back on the Nodes screen. Click on the `ENABLE AUTO REFRESH` link in the upper right corner. After a moment, you should see your new node showing as running.
 
![image010](https://user-images.githubusercontent.com/558905/37634633-e1d376be-2bcd-11e8-815b-8d18be147e99.png)
 
Now, let’s create a new pipeline to use with our node.

In the upper left corner, click on the Jenkins link or **Back to Dashboard**. On the home page, click on **New Item** and give it a name of “pipe1”. Select **Pipeline** for the type and then click OK.

![image012](https://user-images.githubusercontent.com/558905/37634634-e1e1a75c-2bcd-11e8-8957-90905d25a0c9.png)

You’ll now be on the Configure page for your new pipeline.

Switch to the **Pipeline** tab at the top (or scroll down the page to the Pipeline section. In that section is a place to type in the code for our pipeline. We’ll add the main block for our pipeline here to run on our new node.

Enter (or copy and paste) the code below into the text box:

`node('worker_node1') {}`{{execute}}

![image015](https://user-images.githubusercontent.com/558905/37634636-e1fcb902-2bcd-11e8-8ca1-8df75a520159.png)

>Note: you can expand the curlies

Leave this page open for the next lab.

