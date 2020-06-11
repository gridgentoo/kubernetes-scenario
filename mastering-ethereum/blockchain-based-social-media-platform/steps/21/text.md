Let's update the get content function to generate data based on whether the user has any active subscriptions:

To get all the content the user will be seeing, we need to get latestContentId, which is a number of how many pieces of content are available at that moment, in case the user is not subscribed to any hashtags yet:
```
async getContent() {
    const latestContentId = await this.state.contract.methods.latestContentId().call()
    const amount = 10
    const amountPerHashtag = 3
    let contents = []
    let counter = amount
 
```

Get the content pieces if the user is following hashtags by looping through all the IDs:

```
    // If we have subscriptions, get content for those subscriptions 3 pieces per hashtag
    if(this.state.followedHashtags.length > 0) {
        for(let i = 0; i < this.state.followedHashtags.length; i++) {
            // Get 3 contents per hashtag
            let contentIds = await this.state.contract.methods.getContentIdsByHashtag(this.bytes32(this.state.followedHashtags[i]), 3).call()
            let counterTwo = amountPerHashtag
            if(contentIds < amountPerHashtag) counterTwo = contentIds
            for(let a = counterTwo - 1; a >= 0; a--) {
                let content = await this.state.contract.methods.getContentById(i).call()
                content = {
                    id: content[0],
                    author: content[1],
                    time: new Date(parseInt(content[2] + '000')).toLocaleDateString(),
                    message: content[3],
                    hashtags: content[4],
                }
                content.message = web3js.utils.toUtf8(content.message)
                content.hashtags = content.hashtags.map(hashtag => web3js.utils.toUtf8(hashtag))
                contents.push(content)
            }
        }
    }

```

If the user isn't subscribed to any hashtags yet, update the counter variable to loop inversely so that we get the most recent pieces first:
```
    // If we don't have enough content yet, show whats in there
    if(latestContentId < amount) counter = latestContentId
    for(let i = counter - 1; i >= 0; i--) {
        let content = await this.state.contract.methods.getContentById(i).call()
        content = {
            id: content[0],
            author: content[1],
            time: new Date(parseInt(content[2] + '000')).toLocaleDateString(),
            message: content[3],
            hashtags: content[4],
        }
        content.message = web3js.utils.toUtf8(content.message)
        content.hashtags = content.hashtags.map(hashtag => web3js.utils.toUtf8(hashtag))
        contents.push(content)
    }

```

Generate contentsBlock, which contains all the elements that create a piece of content, which is similar to a tweet or a Facebook post:
```
    let contentsBlock = await Promise.all(contents.map(async (element, index) => (
        <div key={index} className="content">
            <div className="content-address">{element.author}</div>
            <div className="content-message">{element.message}</div>
            <div className="content-hashtags">{element.hashtags.map((hashtag, i) => (
                <span key={i}>
                    <Hashtag
                        hashtag={hashtag}
                        contract={this.state.contract}
                        subscribe={hashtag => this.subscribe(hashtag)}
                        unsubscribe={hashtag => this.unsubscribe(hashtag)}
                    />
                </span>
            ))}
            </div>
            <div className="content-time">{element.time}</div>
        </div>
    )))

    this.setState({contentsBlock})
}
```

This getContent() function checks whether the user has any active subscriptions so that it can retrieve up to three pieces of content per hashtag. It will also get up to the 10 most recent articles uploaded to the dApp. It is quite large because it generates data based on the number of hashtags that are available on the smart contract. If you follow 100 hashtags, you'll see 300 new pieces of content since we're getting 3 articles per hashtag in the feed. We're also adding 10 random contents that will be taken from the array of contents in the smart contract.