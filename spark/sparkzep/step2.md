# check spark

k exec sparkzep-spark-master-84cd85f755-8m65s --  spark-shell --version

k exec sparkzep-spark-master-84cd85f755-8m65s --  pyspark --version

k exec sparkzep-spark-master-84cd85f755-8m65s --  ls -lash /opt/spark-1.5.1-bin-hadoop2.6/examples/src/main

k exec sparkzep-spark-master-84cd85f755-8m65s --  ls -lash /opt/spark-1.5.1-bin-hadoop2.6/examples/src/main/java/org/apache/spark/examples

**WIP**
https://community.cloudera.com/t5/Support-Questions/How-to-check-a-correct-install-of-spark-Whether-spark-is/td-p/136122


pyspark --version

# Zeppelin tutorial

Now we have spark and zeppelin bottom up, connect to the ui and run the tutorial.

https://[[HOST_SUBDOMAIN]]-30466-[[KATACODA_HOST]].environments.katacoda.com

On the first instruction, just save the present setting.

and then you well be presented with the 'Load data into table'

Just a remember that Zeppelin instructions are started with the interpretor you want yo use, eg %sql  to run sql queries. %sh  will give you shell commands, and shift-enter to run the query.



