What we have to do now is install the essential packages that we'll need for using React and webpack. First, update your npm version to the latest one with the following:
`npm i -g npm@latest`{{execute}}

Go to your dapp project folder if you haven't done so already and install webpack with the following:
`npm i -g webpack webpack-cli`{{execute}}

#### Webpack
Webpack is a utility that takes all of your JavaScript files and combines them into one single, gigantic, easy-to-manage JavaScript file so that you can optimize development times.

#### Babel
After Webpack, install all the babel dependencies. Babel is a utility that works with webpack to take your JavaScript files and convert them into the latest version so that every browser is compatible with the new JavaScript functionalities, given that there are major differences across browsers that need to be normalized. Babel does just that, and you can install it like so:
`npm i -S @babel/core @babel/preset-env @babel/preset-react babel-loader`{{execute}}

Then, we need to install react.js since we'll use it for our project, as follows:
`npm i -S react react-dom`{{execute}}

