The first thing that must be done when implementing a smart contract inside a React application is the contract instance so that we can start calling methods from that contract all over the decentralized application. We'll use the compiled contract provided by Truffle and the address of it. Let's perform the following steps:

Import web3 into your project:
```
import Web3Js from 'web3'
Why do you think I've named the variable Web3Js instead of just Web3? Because MetaMask injects its own version of web3, which is precisely named Web3, so when we develop, we may be used the injected version of web3, instead of the one that we are interested in importing. It's important to use a slightly different name to avoid interfering with the injected web3 by MetaMask.

Set up web3 with the current provider globally so that you can use it with in your entire application without having to worry about scope problems.
Create a function named setup() that contains the MetaMask setup logic. This function will be executed in the constructor, right when the page loads:
```
class Main extends React.Component {
    constructor() {
        // Previous code omitted for simplicity

this.setup()
    }

    async setup() {
        window.web3js = new Web3Js(ethereum)
        try {
            await ethereum.enable();
        } catch (error) {
            alert('You must approve this dApp to interact with it, reload it to approve it')
        }
    }
}
```

We created a new setup function because we can't use await on the constructor, given that it's not an asynchronous function. Inside it, we created a global web3js variable which is not called web3 (in lowercase), since MetaMask is already using that variable name and we risk using the wrong version. As you can see, the provider in this case is called ethereum, a global variable coming from MetaMask that includes all we need to start using web3; it's a new way of initializing a web3 instance that is compatible with older dApps because of some changes the MetaMask team made regarding security. Then we wait for the enable() function to get permission from the user to inject web3 because we don't want to expose user keys without the user's consent. If the user doesn't allow it, we show an error to let them know that we need them to grant permission for this dApp in order to work properly.

Set up the smart contract instance. Because we have Truffle installed, we can compile our smart contract to generate the JSON file that contains the ABI, which is required to use the application.

Install the wallet provider with `npm i -S truffle-hdwallet-provider`. 

Then modify truffle-config.js with the following code:
```
const HDWalletProvider = require('truffle-hdwallet-provider')
const infuraKey = "https://ropsten.infura.io/v3/8e12dd4433454738a522d9ea7ffcf2cc"

const fs = require('fs')
const mnemonic = fs.readFileSync(".secret").toString().trim()

module.exports = {
  networks: {
    ropsten: {
      provider: () => new HDWalletProvider(mnemonic, infuraKey),
      network_id: 3, // Ropsten's id
      gas: 5500000, // Ropsten has a lower block limit than mainnet
      confirmations: 2, // # of confs to wait between deployments. (default: 0)
      timeoutBlocks: 200, // # of blocks before a deployment times out (minimum/default: 50)
      skipDryRun: true // Skip dry run before migrations? (default: false for public nets )
    }
  }
}
```

Tell Truffle to deploy your contract by creating a 2_deploy_contract.js filename inside your migrations/ folder with the following code:
```
const SocialMedia = artifacts.require("./SocialMedia.sol")

module.exports = function(deployer) {
  deployer.deploy(SocialMedia);
}
```

As you can see, we only have the minimal configuration parameters so keep it clean. Create a .secret file in your project folder and paste your Ethereum seed phrase, which you can get by resetting MetaMask or installing it in another browser if you are worried about making your seed public. That seed phrase will be used by Truffle to deploy the contracts, so be sure to have enough ropsten Ether in your first account. Then run truffle deploy --network ropsten --reset again.

Update your setup function with the following to create a contract instance:

```
async setup() {
    window.web3js = new Web3Js(ethereum)
    try {
        await ethereum.enable();
    } catch (error) {
        alert('You must approve this dApp to interact with it, reload it to approve it')
    }
    const user = (await web3js.eth.getAccounts())[0]
    const contract = new web3js.eth.Contract(ABI.abi, ABI.networks['3'].address, {
        from: user
    })
    await this.setState({contract, user})
}
```

We've set up the user account in the app's state to have easy access whenever we need it.