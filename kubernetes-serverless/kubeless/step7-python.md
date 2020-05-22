To review, here is a very simple Python function. Just two lines:

`cat get.py`{{execute}}

Register the function

`kubeless function deploy get --runtime python3.6 --from-file get.py --handler get.greeting`{{execute}}

Wait a few seconds for it to start, then call it.

`kubeless function call get`{{execute}}

or

`curl localhost:8080/api/v1/namespaces/default/services/get:8080/proxy/ && echo`{{execute}}
