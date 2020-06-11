At the end, you'll have to have two sections: one with the most popular hashtags, which will come from a mapping in our smart contract, and one where you can read more about each specific hashtag while being able to publish content. You may want to set up the style loader to be able to use css on your dApp, which is not set up on the default dApp that you just cloned. To do so, install the following dependencies after stopping webpack:

```
npm i -S style-loader css-loader
```

Now that you installed the required libraries to be able to use CSS files inside your project, you can update your webpack configuration file by adding a new loader inside the loaders block for the css files. Pay attention to the fact that we're using both loaders – style-loader goes first. Otherwise, it won't work:

```
{
    test: /\.css$/,
    exclude: /node_modules/,
    use: [
        { loader: 'style-loader' },
        { loader: 'css-loader' }
    ]
}
```
