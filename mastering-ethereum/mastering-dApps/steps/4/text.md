We can now generate the webpack.config.js file where we'll specify how we want to have our JavaScript files handled, and where the combined version will be deployed. Create an empty webpack.config.js file at the root level of your dapp/ folder with the following configuration:

```
const path = require('path')

module.exports = {
    entry: './src/index.js',
    output: {
        filename: 'bundle.js',
        path: path.join(__dirname, 'dist')
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader'
                }
            }
        ]
    }
}
```

Module exports is the export object that's used in node.js projects. It contains the rules array, where you indicate which files must be passed through which compilers, in this case, babel-loader. The entry and output properties define where our files will be generated after combining them. Amplify the webpack configuration file with some additional information for defining the HTML resulting file; this is required to generate a valid HTML page automatically with your JavaScript files bundled together. Install the following loaders:
`npm i -S html-webpack-plugin html-loader`{{execute}}

Update your webpack configuration like so:

```
const html = require('html-webpack-plugin')
const path = require('path')

module.exports = {
    entry: './src/index.js',
    output: {
        filename: 'bundle.js',
        path: path.join(__dirname, 'dist')
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader'
                }
            }
        ]
    },
    plugins: [
        new html({
            template: './src/index.html',
            filename: './index.html'
        })
    ]
}
```
