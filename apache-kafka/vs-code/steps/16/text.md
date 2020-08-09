From the first command-line terminal (the console producer), send the following three messages (remember to type enter between messages and execute each one in just one line):


`{"event": "CUSTOMER_CONSULTS_ETHPRICE", "currency": {"name": "ethereum", "price": "USD"}, "timestamp": "2018-09-28T09:09:09Z"}`{{execute T1}} 

`{"event": "CUSTOMER_CONSULTS_ETHPRICE", "currency": {"name": "ethereum", "price": "USD"}, "timestamp": "2018-09-28T08:08:14Z"}`{{execute T1}} 

`{"event": "CUSTOMER_CONSULTS_ETHPRICE", "currency": {"name": "ethereum", "price": "USD"}, "timestamp": "2018-09-28T19:51:35Z"}`{{execute T1}} 


# Output
As these are valid messages, the messages typed in the producer console should appear in the valid-messages consumer console window, as in the example:

```
{"event":"CUSTOMER_CONSULTS_ETHPRICE","currency":{"name":"ethereum","price":"USD","rate":1.2077348E-4},"timestamp":"2018-09-28T09:09:09Z"}

{"event":"CUSTOMER_CONSULTS_ETHPRICE","currency":{"name":"ethereum","price":"USD","rate":1.2077348E-4},"timestamp":"2018-09-28T08:08:14Z"}

{"event":"CUSTOMER_CONSULTS_ETHPRICE","currency":{"name":"ethereum","price":"USD","rate":1.2077348E-4},"timestamp":"2018-09-28T19:51:35Z"}
```

 

