The adding content function is the most complex in the dApp that we're building because we need to complete the following tasks:

- Check whether the content given by the user is valid
- Add new content to the right state variables
- Increase the score of the hashtags included in the content piece
- Dynamically store contents in a general hashtag that people can use to find random content without sorting
- Add the user to the array of users if they're a new customer

Because of the many functions that we must implement, the function will inevitably be complex. That's why it is important to take your time to get it right, since we could easily create gas traps that consume all the available gas. Before seeing my solution, go to your computer to implement them as best as possible on your own by performing the following steps:

Add the require() checks to be sure that the content is valid:

```
/// @notice To add new content to the social media dApp. If no hashtags are sent, the content is added to the #general hashtag list.
/// @param _content The string of content
/// @param _hashtags The hashtags used for that piece of content
function addContent(string memory _content, bytes32[] memory _hashtags) public {
    require(bytes(_content).length > 0, 'The content cannot be empty');
    Content memory newContent = Content(latestContentId, msg.sender, now, _content, _hashtags);
    // If the user didn't specify any hashtags add the content to the #general hashtag
```

Depending on whether the user added a hashtag, we'll execute the corresponding functionality to sort and increase the value of those hashtags:
```
    if(_hashtags.length == 0) {
        contentByHashtag['general'].push(newContent);
        hashtagScore['general']++;
        if(!doesHashtagExist['general']) {
            hashtags.push('general');
            doesHashtagExist['general'] = true;
        }
    } else {
        for(uint256 i = 0; i < _hashtags.length; i++) {
            contentByHashtag[_hashtags[i]].push(newContent);
            hashtagScore[_hashtags[i]]++;
            if(!doesHashtagExist[_hashtags[i]]) {
                hashtags.push(_hashtags[i]);
                doesHashtagExist[_hashtags[i]] = true;
            }
        }
    }
```

Sort the arrays by score using the function described earlier and we create the user while emitting the right events:

```
    hashtags = sortHashtagsByScore();
    contentById[latestContentId] = newContent;
    contents.push(newContent);
    if(!doesUserExist[msg.sender]) {
        users.push(msg.sender);
        doesUserExist[msg.sender] = true;
    }
    emit ContentAdded(latestContentId, msg.sender, now, _content, _hashtags);
    latestContentId++;
}
```
