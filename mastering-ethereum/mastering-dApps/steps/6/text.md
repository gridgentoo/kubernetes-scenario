Let's install all the required node package in package.json by running: `npm install`{{execute}}

Finally, you can compile those files with the following, where -p means production:
`webpack -p`{{execute}}

Remember to execute it inside your project folder. After compiling your files, you need to run a static server that will deliver the files to your browser so that you can use your dApp. For that, install http-server using the following command:

`npm i -g http-server`{{execute}}


Then, run it for your distribution folder:
`http-server dist/`{{execute}}

Click on dApp located next to terminal  to see your dApp project live

**Note:** You can also access dApp by visiting [this](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) on your browser.
