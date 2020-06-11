
In Solidity, it will look like this:

```
// Solidity implementation
function optimize(int256[] memory _results, int256 _weight, int256 _bias, int256[] memory _xs, int256 _learningRate) public pure returns(int256, int256) {
    require(_results.length == _xs.length, 'There must be the same number of _results than _xs values');
    int256 weightDerivative = 0;
    int256 biasDerivative = 0;
    uint256 numberOfDataPoints = _xs.length;
    for(uint256 i = 0; i < numberOfDataPoints; i++) {
        weightDerivative += (-2 * _xs[i] * (_results[i] - (_xs[i] * _weight + _bias)) / int256(numberOfDataPoints));
        biasDerivative += (-2 * (_results[i] - (_xs[i] * _weight + _bias)) / int256(numberOfDataPoints));
    }
    _weight = weightDerivative * _learningRate;
    _bias = biasDerivative * _learningRate;
    return (_weight, _bias);
}
```

As you can see, we are calculating both derivatives by using the functions described in the preceding code block so that we can update the weight and bias with the optimized values. The learning rate is the size of the steps we take to reach the minimum point of the graph. If we take big steps, we may miss the minimum, and if we take small steps, we may take too much time to reach that minimum. In any case, it's best to keep a balanced learning rate and try different step sizes. Now we have a way to improve our prediction function.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
