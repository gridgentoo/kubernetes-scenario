
Remember that all smart contracts start with **6080604052**, as you saw in the complete bytecode. Our smart contract contains just a `uint256` assignment, so it follows that bytecode with 6003600055. What we finally have is the following:
`cat Example_sol_Example.bin`{{execute}}


```
60806040526003600055348015601457600080fd5b5060358060226000396000f3fe6080604052600080fdfea165627a7a72305820aa17e74115b5e066ae13d560c624e9abef54adbce68c3443886eadc4e1059cfe0029
```

The rest is irrelevant, since it contains information about the sender and the contract. There are about 100 opcodes, and many different techniques are used in the EVM to translate smart contract code to bytecode so that it can be published to the blockchain efficiently. 

Now, you understand what happens under the hood when you write a smart contract, compile it, and deploy it to the network. The rest is up to the nodes that run their own specific implementation of the Ethereum protocol, so they decide which blocks to take and which ones to ignore. The EVM is a complex virtual environment that processes transactions and bytecode from smart contracts to achieve a global consensus that benefits everybody.