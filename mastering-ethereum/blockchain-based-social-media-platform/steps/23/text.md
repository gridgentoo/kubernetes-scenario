We can now create a function to get the top hashtags and the followed hashtags from the smart contract when the page loads. We'll do it by retrieving the followed and top hashtags. Those will be shown to the user by looping through all of them until the interface is filled with data.

Try to implement it yourself and see the following result once you're done:

Define the variables needed to create the resulting hashtag JSX:
```
async getHashtags() {
    let topHashtagBlock
    let followedHashtagsBlock
    const amount = 10
    const topHashtags = (await contract.methods.getTopHashtags(amount).call()).map(element => web3js.utils.toUtf8(element))
    const followedHashtags = (await this.state.contract.methods.getFollowedHashtags().call()).map(element => web3js.utils.toUtf8(element))
Start looping through the hashtag blocks until we fill the list of top hashtags:
```
    if(topHashtags.length == 0) {
        topHashtagBlock = 'There are no hashtags yet, come back later!'
    } else {
        topHashtagBlock = topHashtags.map((hashtag, index) => (
            <div key={index}>
                <Hashtag
                    hashtag={hashtag}
                    contract={this.state.contract}
                    subscribe={hashtag => this.subscribe(hashtag)}
                    unsubscribe={hashtag => this.unsubscribe(hashtag)}
                />
            </div>
        ))
    }
 

If the user isn't following any hashtags, we'll display a message. If they are, we'll loop through all the followed hashtags to generate the Hashtag component with the required data. Update the state with the new blocks that we just created to display them on the render() function:
```
    if(followedHashtags.length == 0) {
        followedHashtagsBlock = "You're not following any hashtags yet"
    } else {
        followedHashtagsBlock = followedHashtags.map((hashtag, index) => (
            <div key={index}>
                <Hashtag
                    hashtag={hashtag}
                    contract={this.state.contract}
                    subscribe={hashtag => this.subscribe(hashtag)}
                    unsubscribe={hashtag => this.unsubscribe(hashtag)}
                />
            </div>
        ))
    }
    this.setState({topHashtagBlock, followedHashtagsBlock, followedHashtags})