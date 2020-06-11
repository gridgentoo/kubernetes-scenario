Then, it will ask you where you want to export the genesis files to:

![](https://github.com/fenago/katacoda-scenarios/raw/master/mastering-ethereum/ethereum-private-network/steps/5/save.JPG)


You'll see your files in the selected folder. If you didn't choose one, the files will be created in your user folder or wherever your Terminal's location is at that moment. These are the files that you'll find:

- **genesis.json:** Or whatever name you've chosen for your genesis network. This file contains the general chain specification that we saw earlier.
- **genesis-aleth.json:** This is the genesis file for the Aleth Ethereum client. Aleth is just an Ethereum client written in C++. It was previously known as cpp-ethereum.
- **genesis-harmony.json:** Harmony is another independent client written in JavaScript and Java. This is the genesis file compatible with their specification.
- **genesis-parity.json:** Parity is a well-known Ethereum client written in the programming language Rust. This is the genesis file that's compatible with Parity.

Great! You have now exported the genesis file for your private Ethereum blockchain.