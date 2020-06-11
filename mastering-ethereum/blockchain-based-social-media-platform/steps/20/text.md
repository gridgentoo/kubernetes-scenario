To fully implement the smart contract, we have to take a look at each section of the website to update its contents with data from the smart contract. Let's go from top-left to bottom-right. In that order, the first thing we have to decentralize is the top hashtags sections, using the getTopHashtags() function:

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
}
```

You'll also have to update your render() function for when you don't have any top hashtags, since you just deployed your smart contract. We'll get the content from another function named getContent():

```
render() {
    return (
        <div className="main-container">
            <div className="hashtag-block">
                <h3>Top hashtags</h3>
                <div className="hashtag-container">{this.state.topHashtagBlock}</div>
                <h3>Followed hashtags</h3>
                <div className="hashtag-container">{this.state.followedHashtagsBlock}</div>
            </div>
            <div className="content-block">
                <div className="input-container">
                    <textarea ref="content" placeholder="Publish content..."></textarea>
                    <input ref="hashtags" type="text" placeholder="Hashtags separated by commas without the # sign..."/>
                    <button onClick={() => {
                        this.publishContent(this.refs.content.value, this.refs.hashtags.value)
                    }} type="button">Publish</button>
                </div>

                <div className="content-container">
                    {this.state.contentsBlock}
                </div>
            </div>
        </div>
    )
}

```
