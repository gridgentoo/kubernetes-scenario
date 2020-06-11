Finally, we complete the code by creating the train function and initialize the class outside the scope of the class as shown in the following code:

```
    # Python implementation
 def train(self, results, weight, bias, xs, learningRate, iterations):
        error = 0
        for i in range(iterations):
            weight, bias = self.optimizeWeightBias(results, weight, bias, xs, learningRate)
            error = self.cost(results, weight, bias, xs)
            print("Iteration: {}, weight: {:.4f}, bias: {:.4f}, error: {:.2f}".format(i, weight, bias, error))
        return weight, bias

# Initialize the class
LinearRegression()
```

As you can see, we've created a Python class that runs the train function in the constructor. Don't worry if you're not familiar with Python; you just have to understand that the code is training our linear-regression algorithm for more precise calculations. Current directory contains file `linearRegression.py` which contains the python code. You can run it with the following command line:
`python linearRegression.py`{{execute}}

You'll see that the program is constantly reducing the error by taking small steps toward the minimum until it gets to a point where it doesn't improve much. That's okay. We expect it to make precise predictions, but without 100% accuracy. You can then take the final weight and bias to make predictions on your own for that machine learning model.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
