
Update the render() function to generate the content and hashtag blocks because we need a simple way of creating the content to be displayed; all the logic will be executed in the render() function:

```
render() {
    let contentBlock = this.state.content.map((element, index) => (
        <div key={index} className="content">
            <div className="content-address">{element.author}</div>
            <div className="content-message">{element.message}</div>
            <div className="content-hashtags">{element.hashtags.map((hashtag, i) => (
                <span key={i}>
                    {this.generateHashtags(hashtag, index)}
                </span>
            ))}
            </div>
            <div className="content-time">{element.time}</div>
        </div>
    ))
```

Add the hashtag blocks, whose only job is to create the JSX objects that will be displayed to the user, with the generateHashtags() function that we just used:

```
let hashtagBlock = this.state.topHashtags.map((hashtag, index) => (
    <div key={index}>
        {this.generateHashtags(hashtag, index)}
    </div>
))
let followedHashtags = this.state.followedHashtags.map((hashtag, index) => (
    <div key={index}>
        {this.generateHashtags(hashtag, index)}
    </div>
))
```


