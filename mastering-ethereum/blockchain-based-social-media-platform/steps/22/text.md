Each hashtag is a little machine that contains lots of logic to detect whether the user is subscribed. It may seem simple, but remember that we need to get the state of each hashtag for each user, which means that we have to execute a lot of requests that could slow our dApp's performance. Be clean when creating the function so that they run smoothly.

We're using a new component named Hashtag, which is an HTML object that returns an interactive hashtag text that can be clicked to subscribe to it, or unsubscribe. This is the cleanest way of creating such functionality to reduce complexity:

Create the constructor with a few state variables to display or hide the hashtag depending on the user's behavior:
```
class Hashtag extends React.Component {
    constructor(props) {
        super()
        this.state = {
            displaySubscribe: false,
            displayUnsubscribe: false,
            checkSubscription: false,
            isSubscribed: false,
        }
    }

```

Create the bytes32() and checkExistingSubscription() functions to check whether the current user is already following this particular hashtag:
```
    componentDidMount() {
        this.checkExistingSubscription()
    }

    bytes32(name) {
        let nameHex = web3js.utils.toHex(name)
        for(let i = nameHex.length; i < 66; i++) {
            nameHex = nameHex + '0'
        }
        return nameHex
    }

    async checkExistingSubscription() {
        const isSubscribed = await this.props.contract.methods.checkExistingSubscription(this.bytes32(this.props.hashtag)).call()
        this.setState({isSubscribed})
   }

```

The render() function is quite large, so we'll break it down into two main pieces: the functionality to detect whether a user is subscribed and the functionality to display the right buttons:
```
    render() {
        return (
            <span onMouseEnter={async () => {
                if(this.state.checkSubscription) await this.checkExistingSubscription()
                if(!this.state.isSubscribed) {
                    this.setState({
                        displaySubscribe: true,
                        displayUnsubscribe: false,
                    })
                } else {
                    this.setState({
                        displaySubscribe: false,
                        displayUnsubscribe: true,
                    })
                }
            }} onMouseLeave={() => {
                this.setState({
                    displaySubscribe: false,
                    displayUnsubscribe: false,
                })
            }}>

```

Implement the subscribe or unsubscribe buttons that will be shown when the user hovers over the hashtag:

```
                <a className="hashtag" href="#">#{this.props.hashtag}</a>
                <span className="spacer"></span>
                <button onClick={() => {
                    this.props.subscribe(this.props.hashtag)
                    this.setState({checkSubscription: true})
                }} className={this.state.displaySubscribe ? '' : 'hidden'} type="button">Subscribe</button>
                <button onClick={() => {
                    this.props.unsubscribe(this.props.hashtag)
                    this.setState({checkSubscription: true})
                }} className={this.state.displayUnsubscribe ? '' : 'hidden'} type="button">Unsubscribe</button>
                <span className="spacer"></span>
            </span>
        )
    }
}

``` 


The render() function displays the hashtag, which shows a subscribe or unsubscribe button when hovered. The checkExistingSubscription() function gets the state of a particular hashtag subscription to display the right type of button for the user that wishes to unsubscribe.