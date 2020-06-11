Open index.css file, which includes grid components for displaying our application in the best way possible, with a clean structure that is easy to maintain:

Add the general styling to the main components of your application, such as the body and buttons, to make them look better:
```
body {
    margin: 0;
    background-color: whitesmoke;
    font-family: sans-serif;
}

button {
    background-color: rgb(201, 47, 47);
    color: white;
    border-radius: 15px;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: rgb(131, 0, 0);
}
```

Add the general hidden and spacer styles to hide elements and to create a dynamic spacer:

```
.hidden {
    display: none;
}

.spacer {
    margin-right: 5px;
}
```

Add the container's styles to position them with the grid system that is now accepted on all major browsers:
```
.main-container {
    display: grid;
    grid-template-columns: 30% 70%;
    margin: auto;
    width: 50%;
    grid-column-gap: 10px;
}

.input-container {
    margin-bottom: 10px;
    padding: 30px;
    display: grid;
    grid-template-columns: 80% 1fr;
    grid-template-rows: 70% 30%;
    grid-gap: 10px;
}
```

Format the input and text areas to create a better-looking design that is easy to use:

```
.input-container textarea {
    padding: 10px;
    border-radius: 10px;
    font-size: 11pt;
    font-family: sans-serif;
    border: 1px solid grey;
    grid-column: 1 / 3;
}

.input-container input {
    padding: 10px;
    border-radius: 10px;
    font-size: 11pt;
    font-family: sans-serif;
    border: 1px solid grey;
}
```

Provide a great-looking design for all the elements for the content block, which is similar to a tweet in Twitter:

```
.content {
    background-color: white;
    border: 1px solid grey;
    margin-bottom: 10px;
    padding: 30px;
    box-shadow: 4px 4px 0px 0 #cecece;
}
.content-address {
    color: grey;
    margin-bottom: 5px;
}
.content-message {
    font-size: 16pt;
    margin-bottom: 5px;
}
.content-hashtags {
    margin-bottom: 5px;
}
.content-time {
    color: grey;
    font-size: 12pt;
}
```

Format those hashtags to position them in the right places while also increasing their size:
```
.hashtag-block {
    text-align: center;
}

.hashtag-container {
    line-height: 30px;
}

.hashtag {
    font-size: 15pt;
}
```

You can copy and paste that css if you want to achieve the same look. Here's the appearance of the dApp right now: