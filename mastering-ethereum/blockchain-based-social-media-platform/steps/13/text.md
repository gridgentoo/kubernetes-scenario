After doing the required planning, feel free to write the function signatures for all of the needed parts by performing the following steps:

Define the variables that you'll use later on with structs and events first:
```
struct Content {
    uint256 id;
    address author;
    uint256 date;
    string content;
    bytes32[] hashtags;
}

event ContentAdded(uint256 indexed id, address indexed author, uint256 indexed date, string content, bytes32[] hashtags);
```

Add the mappings, arrays, and remaining state variables:

```
mapping(address => bytes32[]) public subscribedHashtags;
mapping(bytes32 => uint256) public hashtagScore; // The number of times this hashtag has been used, used to sort the top hashtags
mapping(bytes32 => Content[]) public contentByHashtag;
mapping(uint256 => Content) public contentById;
mapping(bytes32 => bool) public doesHashtagExist;
mapping(address => bool) public doesUserExist;
address[] public users;
Content[] public contents;
bytes32[] public hashtags;
uint256 public latestContentId;
```

Define the function signatures:
```
function addContent(string memory _content, bytes32[] memory _hashtags) public {}
function subscribeToHashtag(bytes32 _hashtag) public {}
function unsubscribeToHashtag(bytes32 _hashtag) public {}
function getTopHashtags(uint256 _amount) public view returns(bytes32[] memory) {}
function getFollowedHashtags() public view returns(bytes32[] memory) {}
function getContentIdsByHashtag(bytes32 _hashtag, uint256 _amount) public view returns(uint256[] memory) {}
function getContentById(uint256 _id) public view returns(uint256, address, uint256, string memory, bytes32[] memory) {}
function sortHashtagsByScore() public view returns(bytes32[] memory) {}
function checkExistingSubscription(bytes32 _hashtag) public view returns(bool) {}
```

Are you surprised by the number of functions and variables that we came up with in a moment? You probably didn't consider functions such as checkExistingSubscription or getContentIdsByHashtag during that process. I'll be honest, I didn't know that those functions were needed before writing the contract; it's just after creating the entire code that they became necessary. It's okay if you don't come up with all the required variables and functions before creating the code. They will surface at the right moment as you develop. You don't have to write all the functions and plan every single function and variable beforehand; that would be insane. So be patient, and know that, after implementing your initial functions, you may need to add a few additional ones to have the desired functionality.