We need a way to tell users which accounts are performing the best by creating a scoring system that increases hashtags' value. That's why we created the hashtagScore mapping, as a measurement of the popularity of the hashtags being used. The promotion engine is simply a way of rating hashtags by popularity. So, the score of the hashtag will increase when someone subscribes to that hashtag or adds new content for that hashtag. It will decrease when someone unsubscribes. This will all be invisible, so that users just see the top hashtags. 

Let's continue with the subscribe functions to give people the power to follow particular topics that interest them. To implement the promotion engine, we simply have to update the score of the particular hashtag being used in the subscribe and unsubscribe functions. Again, try to implement it yourself before seeing the solution, to sharpen your skills while learning and gaining experience. The following is the subscribe function, which increases the score of the selected hashtag for that particular user:

```
/// @notice To subscribe to a hashtag if you didn't do so already
/// @param _hashtag The hashtag name
function subscribeToHashtag(bytes32 _hashtag) public {
    if(!checkExistingSubscription(_hashtag)) {
        subscribedHashtags[msg.sender].push(_hashtag);
hashtagScore[_hashtag]++;
        hashtags = sortHashtagsByScore();
    }
}
```

Then we have the unsubscribe function, which reduces the hashtag value because it's becoming less relevant:

```
/// @notice To unsubscribe to a hashtag if you are subscribed otherwise it won't do nothing
/// @param _hashtag The hashtag name
function unsubscribeToHashtag(bytes32 _hashtag) public {
    if(checkExistingSubscription(_hashtag)) {
        for(uint256 i = 0; i < subscribedHashtags[msg.sender].length; i++) {
            if(subscribedHashtags[msg.sender][i] == _hashtag) {
                delete subscribedHashtags[msg.sender][i];
hashtagScore[_hashtag]--;
                hashtags = sortHashtagsByScore();
                break;
            }
        }
    }
}
```

The subcribeToHashtag function simply checks whether the user is subscribed already to add that new topic to their list of interests, while also sorting the hashtags since the score of that particular one has been increased. In our smart contract, hashtags are valued by use. The more people that subscribe to them and the more content that gets created for that particular tag, the higher its ranking will be.

The unsubscribeToHashtag function loops through all the hashtags for that particular user and removes the selected one from their list. This loop shouldn't cause any gas problems since we don't expect people to follow hundreds of thousands of topics. Regardless, the right thing to do is to limit the number of subscribable tags to avoid gas errors. I'll leave that up to you. Finally, we reduce the score of that hashtag and we sort all of them with the changes.