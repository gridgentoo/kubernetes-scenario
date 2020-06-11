The main function of Geth is to download the blockchain, so that you can have a full node on your device for whatever purpose you may need. To do so, execute this command on your Terminal:
`geth`{{execute}}

**Important:** It will take several hours to get the complete chain of data since it has massive amounts of information made of past transactions. So, you can skip and go throught rest of the scenario. But you won't be able to execute `geth` cli commands in the next steps.

Running geth without parameters starts to automatically download the latest version of the blockchain in the default directory with a RAM default of about 1 MB. You can change the location where the blockchain will be downloaded with this flag:

```
$ geth --datadir "<your-location>"
```
To change the portion of RAM used to download the blockchain, use this flag:

```
$ geth --cache=1024
```

The number in this flag is how much RAM you want to dedicate exclusively to this process. The more you give it, the faster it will download each component of the main Ethereum chain. Remember that the chain stores every single transaction permanently without the option to delete the past.