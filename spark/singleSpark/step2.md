# Run Scala 
We'll be using the example in: 
https://spark.apache.org/docs/latest/quick-start.html
and we'll do the scala demo's 

To run spark-shell on this machine, just type spark-shell

`spark-shell`{{execute}}

You should now see: `scala>`, to exit just type `:q`

need a refresher on scala?, try leanxinyminutes.com <https://learnxinyminutes.com/docs/scala/>

Let's check out the help function:

`:help`{{execute}}

And do so basic Scala operations - read in a readme file.

`val textFile = spark.read.textFile("/usr/local/spark/README.md")`{{execute}}

And do  a count of the number of items in this dataset.

`textFile.count()`{{execute}}

Look at the first item in the dataset.

`textFile.first()`{{execute}} 

Lets run a filter and find the lines with Spark in them

`val linesWithSpark = textFile.filter(line => line.contains("Spark"))`{{execute}}

`textFile.filter(line => line.contains("Spark")).count()`{{execute}} 




### We're done with this section, lets exit scala with 

`:quit`{{execute}}

