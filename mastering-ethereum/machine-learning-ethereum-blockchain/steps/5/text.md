
We need to calculate the error to optimize our prediction function to make more accurate predictions later on. Now that the concept is clear, we can implement that function in Python. In Solidity, we want it to calculate the error from a specific solution for our marketplace in order to discard those that have an excessively large error. The cost function in Python will be used by the buyers to verify the result of their training and it will be used by sellers in Solidity to verify the submissions. Let's look at the following code:

```
# The cost function implemented in python
def cost(results, weight, bias, xs):
    error = 0.0
    numberOfDataPoints = len(xs)
    for i in range(numberOfDataPoints):
        error += (results[i] - (weight * xs[i] + bias)) ** 2
    return error / numberOfDataPoints
```
The xs parameter is an array of independent variables, x—that we saw in the prediction function. Here's how it looks in Solidity. Because it's a pure function, we don't have to worry about gas costs since everything will be executed locally without having to modify the state from the blockchain:

```
// The cost function implemented in solidity
function cost(int256[] memory _results, int256 _weight, int256 _bias, int256[] memory _xs) public pure returns(int256) {
    require(_results.length == _xs.length, 'There must be the same number of _results than _xs values');
    int256 error = 0; // Notice the int instead of uint since we want negative values too
    uint256 numberOfDataPoints = _xs.length;
    for(uint256 i = 0; i < numberOfDataPoints; i++) {
        error += (_results[i] - (_weight * _xs[i] + _bias)) * (_results[i] - (_weight * _xs[i] + _bias));
    }
    return error / int256(numberOfDataPoints);
}
```

As you can see, we've included the prediction function inside the for loop to calculate the result minus the prediction squared so that we can calculate the error from the cost function. This will be used by sellers who want to optimize a specific linear regression from a buyer to make accurate predictions.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
