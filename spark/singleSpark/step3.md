# Run python
Now we'll the Python demo.

`pyspark`{{execute}}

In order to quit pyspark: `quit()`, and for help: `help()`

We'll run the similar commands in step 2, but in python:

Read in the text file:

`textFile = spark.read.text("/usr/local/spark/README.md")`{{execute}}

 Number of rows in this DataFrame

`textFile.count() `{{execute}}

First row in this DataFrame

`textFile.first() `{{execute}}

Run a filter and find the lines with Spark in them

`linesWithSpark = textFile.filter(textFile.value.contains("Spark"))`{{execute}}

`textFile.filter(textFile.value.contains("Spark")).count()  # How many lines contain "Spark"?`{{execute}}

And we've finished the python demo.

`quit()`{{execute}}

Congrats, you've finished the lab.

Head over to spark.apache.org to learn more and try out more examples. 