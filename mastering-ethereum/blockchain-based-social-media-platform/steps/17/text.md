Next, let's see the getter functions that we'll use to show data to our users. These functions don't cost any gas because they are reading data from the downloaded and synchronized blockchain, which is always available without depending on an internet connection. Let's take a look at the following steps:

Create the getTopHashtags() function, which returns a list of names in bytes32 format to the user so that they can see which ones are trending. This is the main discovery system for new content:
```
/// @notice To get the top hashtags
/// @param _amount How many top hashtags to get in order, for instance the top 20 hashtags
/// @return bytes32[] Returns the names of the hashtags
function getTopHashtags(uint256 _amount) public view returns(bytes32[] memory) {
    bytes32[] memory result;
    if(hashtags.length < _amount) {
        result = new bytes32[](hashtags.length);
        for(uint256 i = 0; i < hashtags.length; i++) {
            result[i] = hashtags[i];
        }
    } else {
        result = new bytes32[](_amount);
        for(uint256 i = 0; i < _amount; i++) {
            result[i] = hashtags[i];
        }
    }
    return result;
}
```

Add the function to get the followed hashtags, which is quite straightforward because it returns the specified list using the subscribedHashtags[] mapping:

```
/// @notice To get the followed hashtag names for this msg.sender
/// @return bytes32[] The hashtags followed by this user
function getFollowedHashtags() public view returns(bytes32[] memory) {
    return subscribedHashtags[msg.sender];
}
```

Implement the getContentIdsByHashtag() function. This will be responsible for returning an array of IDs that contain all the pieces of content for a particular hashtag that a user may be subscribed to:

```
/// @notice To get the contents for a particular hashtag. It returns the ids because we can't return arrays of strings and we can't return structs so the user has to manually make a new request for each piece of content using the function below.
/// @param _hashtag The hashtag from which get content
/// @param _amount The quantity of contents to get for instance, 50 pieces of content for that hashtag
/// @return uint256[] Returns the ids of the contents so that you can get each piece independently with a new request since you can't return arrays of strings
function getContentIdsByHashtag(bytes32 _hashtag, uint256 _amount) public view returns(uint256[] memory) {
    uint256[] memory ids = new uint256[](_amount);
    for(uint256 i = 0; i < _amount; i++) {
        ids[i] = contentByHashtag[_hashtag][i].id;
    }
    return ids;
}
```

Add the simple getContentById() function, required to get the struct of IDs broken down into digestible variables, since we can't return structs yet:

```
/// @notice Returns the data for a particular content id
/// @param _id The id of the content
/// @return Returns the id, author, date, content and hashtags for that piece of content
function getContentById(uint256 _id) public view returns(uint256, address, uint256, string memory, bytes32[] memory) {
    Content memory c = contentById[_id];
    return (c.id, c.author, c.date, c.content, c.hashtags);
}
```

The preceding functions are pretty straightforward . The getContentIdsByHashtag function is a bit tricky since we wouldn't normally need it, but, because Solidity doesn't allow us to return arrays of structs or arrays of strings, we have to get the IDs so that to later we can get each piece of content independently with the getContentById function, which does return each variable successfully. 

 

Here are the two last helper functions that we need to make everything possible:

The sortHashtagsByScore() function is used to return a list of tags sorted by the popularity of each one since we're reading the values of each tag:
```
/// @notice Sorts the hashtags given their hashtag score
/// @return bytes32[] Returns the sorted array of hashtags
function sortHashtagsByScore() public view returns(bytes32[] memory) {
    bytes32[] memory _hashtags = hashtags;
    bytes32[] memory sortedHashtags = new bytes32[](hashtags.length);
    uint256 lastId = 0;
    for(uint256 i = 0; i < _hashtags.length; i++) {
        for(uint j = i+1; j < _hashtags.length; j++) {
            // If it's a buy order, sort from lowest to highest since we want the lowest prices first
            if(hashtagScore[_hashtags[i]] < hashtagScore[_hashtags[j]]) {
                bytes32 temporaryhashtag = _hashtags[i];
                _hashtags[i] = _hashtags[j];
                _hashtags[j] = temporaryhashtag;
            }
        }
        sortedHashtags[lastId] = _hashtags[i];
        lastId++;
    }
    return sortedHashtags;
}
```

The checkExistingSubscription() function returns a Boolean for whether a user is subscribed:

```
/// @notice To check if the use is already subscribed to a hashtag
/// @return bool If you are subscribed to that hashtag or not
function checkExistingSubscription(bytes32 _hashtag) public view returns(bool) {
    for(uint256 i = 0; i < subscribedHashtags[msg.sender].length; i++) {
        if(subscribedHashtags[msg.sender][i] == _hashtag) return true;
    }
    return false;
}
```

The sort function is quite difficult to read because of its apparent complexity. Nevertheless, it's just a couple of for loops, a normal one, and a reversed one inside the other which continuously moves the higher-score hashtags, to the top until the best one is in the first position of our sortedHashtags array. This will be used to replace the past, unsorted-state hashtags array.

The checkExistingSubscription function loops through all of your subscribed hashtags and returns true if the provided one is in your list. This is needed for the subscription functions to keep the arrays clean without duplicating subscriptions.