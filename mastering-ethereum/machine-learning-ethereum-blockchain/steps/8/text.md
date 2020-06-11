We can begin to improve our model with a new function that loops through several optimization calls until we reach the minimum, at which point the model will be fully optimized. Here's what it looks like:

```
# Python implementation
def train(results, weight, bias, xs, learningRate, iterations):
 error = 0
 for i in range(iterations):
    weight, bias = optimizeWeightBias(results, weight, bias, xs, learningRate)
    error = cost(results, weight, bias, xs)
    print("Iteration: {}, weight: {:.4f}, bias: {:.4f}, error: {:.2}".format(i, weight, bias, error))
 return weight, bias
```

The Solidity implementation looks pretty similar although we have to make sure that the results and independent variables values have the same length to avoid errors as shown in the following code:

```
// Solidity implementation
function train(int256[] memory _results, int256 _weight, int256 _bias, int256[] memory _xs, int256 _learningRate, uint256 _iterations) public pure returns(int256, int256) {
    require(_results.length == _xs.length, 'There must be the same number of _results than _xs values');
    int256 error = 0;
    for(uint256 i = 0; i < _iterations; i++) {
        (_weight, _bias) = optimize(_results, _weight, _bias, _xs, _learningRate);
        error = cost(_results, _weight, _bias, _xs);
    }
    return (_weight, _bias);
}
```

As you can see, we are using the optimization function along with the cost function to continuously reduce the error by updating the weight and bias parameters for the specified number of iterations.

Now you should be able to create and train linear regression models to make predictions using the prediction function after training your model with the train function. The following is the full Python code for your reference although you can see the updated version on the official GitHub at https://github.com/merlox/machine-learning-ethereum/blob/master/linearRegression.py.

We start by creating the constructor which will train the model with some initial random values using the uniform library because it returns a floating number between 0 and 1 as shown in the following code:

```
from random import uniform

class LinearRegression:
    xs = [3520, 192, 91, 9271]
    results = [20, 3, 0, 88]

def __init__(self):
        initialWeight = uniform(0, 1)
        initialBias = uniform(0, 1)
        learningRate = 0.00000004
        iterations = 2000
        print('Initial weight {}, Initial bias {}, Learning rate {}, Iterations {}'.format(initialWeight, initialBias, learningRate, iterations))
        finalWeight, finalBias = self.train(self.results, initialWeight, initialBias, self.xs, learningRate, iterations)
        finalError = self.cost(self.results, finalWeight, finalBias, self.xs)
        print('Final weight {:.4f}, Final bias {:.4f}, Final error {:.4f}, Prediction {:.4f} out of {}, Prediction Two {:.4f} out of {}'.format(finalWeight, finalBias, finalError, self.prediction(self.xs[1], finalWeight, finalBias), self.results[1], self.prediction(self.xs[3], finalWeight, finalBias), self.results[3]))
```
Then we implement the prediction and cost function, as you just learned, down below the constructor as shown in the following code:

```
    # Python implementation
def prediction(self, x, weight, bias):
        return weight * x + bias

    # The cost function implemented in python
def cost(self, results, weight, bias, xs):
        error = 0.0
        numberOfDataPoints = len(xs)
        for i in range(numberOfDataPoints):
            error += (results[i] - (weight * xs[i] + bias)) ** 2
        return error / numberOfDataPoints
```

After that, we add the optimized weights and the bias function as shown in the following code:

```
    # Python implementation, returns the optimized weight and bias for that step
 def optimizeWeightBias(self, results, weight, bias, xs, learningRate):
        weightDerivative = 0
        biasDerivative = 0
        numberOfDataPoints = len(results)
        for i in range(numberOfDataPoints):
            weightDerivative += -2 * xs[i] * (results[i] - (xs[i] * weight + bias))
            biasDerivative += -2 * (results[i] - (xs[i] * weight + bias))

        weight -= (weightDerivative / numberOfDataPoints) * learningRate
        bias -= (biasDerivative / numberOfDataPoints) * learningRate

        return weight, bias
```
Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
