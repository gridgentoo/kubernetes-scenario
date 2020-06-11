Publishing new pieces of content is a simple task that requires that we verify that all the inputs contain valid strings of text. Since we are storing hashtags in a bytes32 variable, we need to format the hashtags introduced by the user properly so that the smart contract is able to process them securely.

Let's make the publish function work so that we can start generating content by performing the following steps:

Create the bytes32() function if you haven't done so, because we'll need it soon:
```
bytes32(name) {
    let nameHex = web3js.utils.toHex(name)
    for(let i = nameHex.length; i < 66; i++) 
    {
        nameHex = nameHex + '0'
    }
    return nameHex
}
```

Add the publishContent() function to process the message with the hashtags. The hashtags will be given in a string format that contains a list of comma-separated strings without the hash symbol (#). Make sure that the hashtags are properly separated and formatted for the contract:

```
async publishContent(message, hashtags) {
    if(message.length == 0) alert('You must write a message')
    hashtags = hashtags.trim().replace(/#*/g, '').replace(/,+/g, ',').split(',').map(element => this.bytes32(element.trim()))
    message = this.bytes32(message)
    try {
        await this.state.contract.methods.addContent(message, hashtags).send({
            from: this.state.user,
            gas: 8e6
        })
    } catch (e) {console.log('Error', e)}
    await this.getHashtags()
    await this.getContent()
}
```

Here's the explanation for the two functions we just added:

bytes32(): This function is used to convert normal strings into hexadecimals valid for Solidity, since the new update forces web3 users to convert data to hexadecimal when dealing with bytes types of variables.
publishContent(): This function looks a bit messy because we are using regex to convert the hashtag input from the user to a valid array of clear strings per hashtag. It's doing things such as removing spaces, removing duplicate commas and tag symbols, and then breaking the string into a valid array that can be used in our smart contract.
Remember to update your setup() function so that it gets the latest contents when loading:
```
async setup() {
    window.web3js = new Web3Js(ethereum)
    try {
        await ethereum.enable();
    } catch (error) {
        alert('You must approve this dApp to interact with it, reload it to approve it')
    }
    const user = (await web3js.eth.getAccounts())[0]
    window.contract = new web3js.eth.Contract(ABI.abi, ABI.networks['3'].address, {
        from: user
    })
    await this.setState({contract, user})
    await this.getHashtags()
    await this.getContent()
}
```

It's time to focus on creating the subscription functions. They will be executed when the user clicks on subscribe or unsubscribe, depending on the current state. Try to implement them yourself and come back once you're done to compare your solution with mine. Remember, this is about trying and failing until the code becomes good enough. Here's my solution:

```
async subscribe(hashtag) {
    try {
        await this.state.contract.methods.subscribeToHashtag(this.bytes32(hashtag)).send({from: this.state.user})
    } catch(e) { console.log(e) }
    await this.getHashtags()
    await this.getContent()
}

async unsubscribe(hashtag) {
    try {
        await this.state.contract.methods.unsubscribeToHashtag(this.bytes32(hashtag)).send({from: this.state.user})
    } catch(e) { console.log(e) }
    await this.getHashtags()
    await this.getContent()
}
```

Both functions are quite simple. They run the appropriate subscribe or unsubscribe functions when the user presses the button next to the hashtag name. Notice how we're using a try catch to avoid breaking the entire application if something fails when calling the contract; that's also because sometimes it has a weird failing system where it stops executing for no reason. Just add try catch blocks when you feel like you need to.