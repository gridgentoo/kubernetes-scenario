We can now create the render function with all the logic, but be warned: it's a bit complex given that we are displaying all the arrays from the state, so be patient and see the code in chunks to understand it. Follow these steps:

Create a new function to generate the hashtag's HTML, because we want to add variable logic to the buttons to be sure that the hashtag text reacts to the user displaying the subscribe or unsubscribe button. Remember that we want users to be able to follow hashtags; that's why we need subscribe and unsubscribe buttons:

```
generateHashtags(hashtag, index) {
    let timeout
    return (
        <span onMouseEnter={() => {
            clearTimeout(timeout)
            this.setState({
                displaySubscribe: true,
                displaySubscribeId: `subscribe-${hashtag}-${index}`,
            })
        }} onMouseLeave={() => {
            timeout = setTimeout(() => {
                this.setState({
                    displaySubscribe: false,
                    displaySubscribeId: '',
                })
            }, 2e3)
        }}>
            <a className="hashtag" href="#">#{hashtag}</a>
            <span className="spacer"></span>
            <button ref={`subscribe-${hashtag}-${index}`} className={this.state.displaySubscribe && this.state.displaySubscribeId == `subscribe-${hashtag}-${index}` ? '' : 'hidden'} type="button">Subscribe</button>
            <span className="spacer"></span>
        </span>
    )
}
```
