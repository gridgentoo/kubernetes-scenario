There are additional languages also supported out of the box from Kubeless. Here is a NodeJS example. Deploy the function.

`kubeless function deploy hello-js --runtime nodejs8 --from-file hello.js --handler hello.greeting`{{execute}}

See the new function _hello.greeting_ listed and confirm the status is _Ready_, it may take a minute.

`kubeless function list`{{execute}}

`kubeless function describe hello-js`{{execute}}

Once ready, run the function.

`kubeless function call hello-js --data '{"kubeless":"rocks"}'`{{execute}}
