What's interesting about this private blockchain is that you can connect it to the Remix IDE. This will allow you to deploy and test contracts at extreme speeds. To be able to connect your private blockchain with the remix IDE, you have to allow the remix domain in your list of allowed domains. Simply execute this modified command to start the blockchain:

`geth --nodiscover --datadir .ethereum/ --unlock 0x<YOUR-ETHEREUM-ADDRESS> --mine --rpc --rpcapi eth,net,web3 --rpccorsdomain https://remix.ethereum.org`{{copy}}

With my Ethereum address, it looks like this:

```
geth --nodiscover --networkid 77 --datadir .ethereum/ --unlock 0xf30c37b1e5ed82eebd1a7cf4c66cb9497faa4799 --mine --rpc --rpcapi eth,net,web3 --rpccorsdomain https://remix.ethereum.org
```

**Caution:** The lab environment has limited resources. So, running above command will end the session.