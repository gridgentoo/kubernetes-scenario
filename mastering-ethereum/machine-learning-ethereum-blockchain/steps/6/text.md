Now that we can make predictions given some parameters and calculate the precision of those predictions with the cost function, we have to work on improving those predictions by reducing the error. How do we reduce the error generated from the cost function? By adjusting the weight and bias of our prediction function with an optimization algorithm. In this case, we'll use gradient descent which allows us to continuously reduce the error. Here's a graph that explains how it works:


We start with a high error caused by random weight and bias values, then we reduce the error by optimizing those parameters until we reach a good enough prediction model, the local minimum in the graph. The idea is to calculate the partial derivatives of the weight and bias to see how they affect the final prediction until we reach the minimum. We won't get into the math of calculating those derivatives, since it could lead to confusion. So the resulting function with the partial derivatives looks like this:

```
weightDerivative = sum(-2x * (result - (x * weight + bias))) / numberOfDataPoints

biasDerivative = sum(-2 * (result - (x * weight + bias))) / numberOfDataPoints
```

Let's take a look at the implementation of those functions to update the weight and bias of our machine learning algorithm:

```
# Python implementation, returns the optimized weight and bias for that step
def optimizeWeightBias(results, weight, bias, xs, learningRate):
    weightDerivative = 0
    biasDerivative = 0
    numberOfDataPoints = len(results)
    for i in range(numberOfDataPoints):
        weightDerivative += (-2 * xs[i] * (results[i] - (xs[i] * weight + bias)) / numberOfDataPoints)
        biasDerivative += (-2 * (results[i] - (xs[i] * weight + bias)) / numberOfDataPoints)

    weight -= weightDerivative * learningRate
    bias -= biasDerivative * learningRate
return weight, bias
```
Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
