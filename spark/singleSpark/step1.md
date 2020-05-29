# Install spark and tools

Lets update Ubuntu first:

`sudo apt-get update`{{execute}}

For full functionality, spark needs java 8

`java -version`{{execute}}

We'll also need python:   
`python -V`{{execute}}   
 and python 3   
 `python3 -V`{{execute}}   

and update it:
`pip install --upgrade pip`{{execute}}


Download Spark (we're using release 2.4, package 2.7):
`curl -O http://apache.mirrors.nublue.co.uk/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz`{{execute}}



Extract it:
`tar -xvf spark-2.4.5-bin-hadoop2.7.tgz`{{execute}}

And set it up for execution:
`mv spark-2.4.5-bin-hadoop2.7 /usr/local/spark`{{execute}} 



`export SPARK_HOME=/usr/local/spark`{{execute}}

`export PATH=$PATH:$SPARK_HOME/bin`{{execute}}


check JAVA
`echo $JAVA_HOME`{{execute}}
should equal
`JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre`{{execute}}

And finally lets check spark (for scala) is installed and working:
`spark-shell --version`{{execute}} 

and for python:
`pyspark --version`{{execute}}

