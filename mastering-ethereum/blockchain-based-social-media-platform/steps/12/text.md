Now we can start creating our smart contract by describing the idea behind it. Create a file named SocialMusic.sol inside your contracts/ folder and write a description of what should be in the final version of that contract at the top of the file in comments. Try to do it yourself before looking at my own solution since the only way to learn is to practice by yourself:

// This is a social media smart contract that allows people to publish strings of text in short formats with a focus on hashtags so that they can follow, read and be in touch with the latest content regarding those hashtags. There will be a mapping of the top hashtags. A struct for each piece of content with the date, author, content and array of hashtags. We want to avoid focusing on specific users that's why user accounts will be anonymous where addresses will the be the only identifiers.
```
pragma solidity ^0.5.5;

contract SocialMedia {}
```
