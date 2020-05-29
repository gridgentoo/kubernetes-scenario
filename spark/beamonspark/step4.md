`wget https://www.gutenberg.org/ebooks/2264.txt.utf-8 -O macbeth.txt` WIP blocked by gdpr


`wget https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt -O sonnets.txt`{{execute}}

https://beam.apache.org/get-started/wordcount-example/



Run directly
`python -m apache_beam.examples.wordcount_minimal --input sonnets.txt --output counts`{{execute}}



Run on spark:

https://beam.apache.org/get-started/quickstart-py/#execute-a-pipeline

Currently, running wordcount.py on Spark requires a full download of the Beam source code.
See https://beam.apache.org/roadmap/portability/#python-on-spark for more information.


