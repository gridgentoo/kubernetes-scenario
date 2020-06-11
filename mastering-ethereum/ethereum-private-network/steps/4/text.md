
Then, it will ask you if the precompile-addresses should be pre-funded with 1 wei. Say **yes** to that. It is basically a bunch of addresses that will be required for compiling the blockchain. 

After that, specify a random network ID: chose **77** as the ID. The main Ethereum public network has an ID of **1**, so you have to choose a different number to differentiate your blockchain from theirs. This is important to avoid replay attacks where a malicious user could take a transaction from one blockchain and execute it again in another blockchain for their own benefit. This ID number avoids precisely that vulnerability:

![](https://github.com/fenago/katacoda-scenarios/raw/master/mastering-ethereum/ethereum-private-network/steps/4/genesis.JPG)


You've configured and created the `genesis.json` file that will be used to start your own private blockchain at any time. Now, you have to export it to be able to use it. To do so, select the `second` option of the already executing puppeth command – `Manage existing genesis` – then select `Export genesis configurations`:

![](https://github.com/fenago/katacoda-scenarios/raw/master/mastering-ethereum/ethereum-private-network/steps/4/export.JPG)


