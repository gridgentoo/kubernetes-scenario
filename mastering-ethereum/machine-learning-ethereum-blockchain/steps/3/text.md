First, you need to understand that our simple linear-regression algorithms predict values using the following function:

```
y = weight * x + bias
```

If we are predicting the number of sales based on the number of visitors to a website, our prediction function would look like this:

```
Sales = weight * visitors + bias
```

Our goal is to obtain fixed weight and bias values to optimize our prediction function so that we get a realistic estimate of sales. For instance, a trained linear regression would look like this:

```
Sales = 0.43 * visitors + 0.9
```

We got a weight of 0.43 and a bias of 0.9 after training from a given dataset. We should be able to use that optimized function to make accurate predictions for our particular needs with great results. We need to implement the prediction function in Python and in Solidity because sellers will use Python to train the model, while we'll use Solidity to verify the result given by those sellers. Here's how our prediction function looks in Python and Solidity for our marketplace:

```
# Python implementation
def prediction(x, weight, bias):
    return weight * x + bias
```

For your reference, here's the Solidity function that we'll add to allow sellers and buyers to verify the precision of the model by making predictions:

```
// Solidity implementation
function prediction(uint256 _x, uint256 _weight, uint256 _bias) public pure returns(uint256) {
 return _weight * _x + _bias;
}
```
Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
