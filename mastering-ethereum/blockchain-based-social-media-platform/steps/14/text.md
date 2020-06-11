Those function are not clear enough yet, so why don't you write the NatSpec documentation about each one of them? It's a tedious process but you'll thank yourself for it since it will remind you of what you're doing while coding. Here is my version with the included documentation:

Start with the add content, subscribe, and unsubscribe functions:

```
/// @notice To add new content to the social media dApp. If no hashtags are sent, the content is added to the #general hashtag list.
/// @param _content The string of content
/// @param _hashtags The hashtags used for that piece of content
function addContent(string memory _content, bytes32[] memory _hashtags) public {}

/// @notice To subscribe to a hashtag if you didn't do so already
/// @param _hashtag The hashtag name
function subscribeToHashtag(bytes32 _hashtag) public {}

/// @notice To unsubscribe to a hashtag if you are subscribed otherwise it won't do nothing
/// @param _hashtag The hashtag name
function unsubscribeToHashtag(bytes32 _hashtag) public {}
```

The getter functions for the top and followed hashtags. We need these functions to display them on the sidebar of the user interface:
```
/// @notice To get the top hashtags
/// @param _amount How many top hashtags to get in order, for instance the top 20 hashtags
/// @return bytes32[] Returns the names of the hashtags
function getTopHashtags(uint256 _amount) public view returns(bytes32[] memory) {}

/// @notice To get the followed hashtag names for this msg.sender
/// @return bytes32[] The hashtags followed by this user
function getFollowedHashtags() public view returns(bytes32[] memory) {}
```

The getter functions by ID. We need them to return the struct variables broken down into individual pieces:

```
/// @notice To get the contents for a particular hashtag. It returns the ids because we can't return arrays of strings and we can't return structs so the user has to manually make a new request for each piece of content using the function below.
/// @param _hashtag The hashtag from which get content
/// @param _amount The quantity of contents to get for instance, 50 pieces of content for that hashtag
/// @return uint256[] Returns the ids of the contents so that you can get each piece independently with a new request since you can't return arrays of strings
function getContentIdsByHashtag(bytes32 _hashtag, uint256 _amount) public view returns(uint256[] memory) {}

/// @notice Returns the data for a particular content id
/// @param _id The id of the content
/// @return Returns the id, author, date, content and hashtags for that piece of content
function getContentById(uint256 _id) public view returns(uint256, address, uint256, string memory, bytes32[] memory) {}
```

The helper functions to sort hashtags and check existing subscriptions. These will be used when a user subscribes to update the score of the entire hashtags by ordering them, depending on the score:

```
/// @notice Sorts the hashtags given their hashtag score
/// @return bytes32[] Returns the sorted array of hashtags
function sortHashtagsByScore() public view returns(bytes32[] memory) {}

/// @notice To check if the use is already subscribed to a hashtag
/// @return bool If you are subscribed to that hashtag or not
function checkExistingSubscription(bytes32 _hashtag) public view returns(bool) {}
```

The NatSpec documentation describes all of your functions with a basic description, the parameters, and the return values for other coders to see, so that they can maintain your code. They also help you understand what's going on when the code base grows.

Next, we must implement all the functions one by one until all of them are completed. This is the most time-extensive process since some parts are harder than others, considering the limitations of Solidity. Try to stay positive while doing it. You'll finish it earlier than you expect if you set up a one- or two-hour timer where you can't get distracted before completing it. That's the famous Pomodoro technique to maximize productivity, and I suggest you to use it to get more stuff done in less time.