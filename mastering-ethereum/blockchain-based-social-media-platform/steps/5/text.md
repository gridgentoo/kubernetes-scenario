Open the index.js file and start creating your user interface. First, I start with the constructor by creating some necessary variables that we'll use later on:

Set up the required imports for any React project plus the css file that we can now import thanks to the style and css loaders:
```
import React from 'react'
import ReactDOM from 'react-dom'
import './index.css'
```

Set up the constructor with some dummy data to see how the final application will look once we populate it with variables from the smart contract:

```
class Main extends React.Component {
    constructor() {
        super()

        this.state = {
            content: [{
                author: '0x211824098yf7320417812j1002341342342341234',
                message: 'This is a test',
                hashtags: ['test', 'dapp', 'blockchain'],
                time: new Date().toLocaleDateString(),
            }, {
                author: '0x211824098yf7320417812j1002341342342341234',
                message: 'This is another test',
                hashtags: ['sample', 'dapp', 'Ethereum'],
                time: new Date().toLocaleDateString(),
            }],
            topHashtags: ['dapp', 'Ethereum', 'blockchain', 'technology', 'design'],
            followedHashtags: ['electronics', 'design', 'robots', 'futurology', 'manufacturing'],
            displaySubscribe: false,
            displaySubscribeId: '',
        }
    }
```

Create the render() function with the ReactDOM render:

```
    render() {
        return (
            <div className="main-container">
            </div>
        )
    }
}

ReactDOM.render(<Main />, document.querySelector('#root'))
```

As you can see, the state of our application contains the content object with an Ethereum address as the author of that piece, the message, the hashtags, and the time. We may later change that, but for now it's good enough. We also added two arrays, which contain the top hashtags and the followed tags for this particular user. Those display subscribe variables are a necessary evil to display a subscribe button every time a user hovers a hashtag so that they have the choice to subscribe to improve interactivity of the dApp. 