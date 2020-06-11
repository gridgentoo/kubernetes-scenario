
At the end of the render() function, add the return block with the block variables that we just set up:
```
    return (
        <div className="main-container">
            <div className="hashtag-block">
                <h3>Top hashtags</h3>
                <div className="hashtag-container">{hashtagBlock}</div>
                <h3>Followed hashtags</h3>
                <div className="hashtag-container">{followedHashtags}</div>
            </div>
            <div className="content-block">
                <div className="input-container">
                    <textarea placeholder="Publish content..."></textarea>
                    <input type="text" placeholder="Hashtags separated by commas..."/>
                    <button type="button">Publish</button>
                </div>

                <div className="content-container">
                    {contentBlock}
                </div>
            </div>
        </div>
    )
}
```

We added a function named generateHashtags since we have to add the same logic to display the subscribe button in many places, so it made sense to craft a function that does precisely that when needed without duplicating these long blocks of code. Then, in the render() function, you can see that we are using that function to generate the hashtag logic in the many places where hashtags will be used. Before the return, we have three variables that are simply generating JSX components dynamically with our state data. Finally, the render() function is displaying those blocks nicely.