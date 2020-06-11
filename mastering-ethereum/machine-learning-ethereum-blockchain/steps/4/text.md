
To train our linear-regression algorithm to generate accurate predictions, we need a cost function. A cost function is one way to analyze how well our prediction function is working for our dataset. It gives us an error rate which is essentially the difference between the real-world result versus the prediction. The smaller the error, the better predictions we'll make. The cost function takes the real result and the prediction to output the error from our model like so:

```
error = result - prediction
```

There are many different types of cost functions. In our case, we'll use the mean squared error(MSE) cost function, which looks like this:

```
error = sum((result - prediction)2) / numberOfDataPoints
```

To make it clearer, we can add the prediction function with all the parameters so that you can see how the variables play out in the cost function as shown in the following code:

```
error = sum((result - prediction(x, weight, bias))2) / numberOfDataPoints
```

Here, sum() is the addition of all the real results minus the prediction squared, the sum of all the resulting dataset values. All of this is divided by the number of data points. Remember that result is the actual value that we are trying to predict. For instance, going back to our previous example where we are trying to predict how many sales we'll get per visitor, the result would be 10 sales, which comes from 200 visitors, while prediction is our own estimation from the weight and bias.

To help you understand the function better, consider the following example dataset of fake gun owners in a country and crimes per country; in this example, we are interested in learning how the number of guns affects the number of crimes per country. Using this data, we can predict crimes so that we can mobilize a specific number of police officers to deal with these situations. Remember that this is fake data to illustrate how the cost function will work:

Country | Total number of guns | Number of crimes per year
--- | --- | ---
`Germany` | 3,520 | 20
`Estonia` | 192 | 3
`Bahamas` | 91 | 0
`Brazil` | 9,271 | 88

We first initialize our prediction function with a random weight and bias as shown in the following code:

```
// Our prediction function definition for you to remember how it looked like
y = weight * x + bias

// Our prediction function with random weight and bias
prediction = 0.1 * x + 0.4
```

The prediction of crimes for Germany would look like the following:

```
prediction = 0.1 * 3520 + 0.4 = 352.4 crimes per year
```

We get 352.4 crimes which we can approximate to 352 since it doesn't make sense to talk about crimes in terms of decimal points. As you can see, our prediction with that weight and bias is higher than the real result of 20 crimes per year since our model isn't trained yet. So it's normal to expect huge differences when using real values.

Then we calculate the cost function for all of those values. Let's see how it looks for Germany:

```
// Our cost function definition for you to remember how it looked like
error = sum((result - prediction)2) / numberOfDataPoints

// Our cost function for the initial dataset
error = sum((20 - 352)2) / 1
```

We are applying the cost function for one data point to see the error of the initial prediction so that you can see how it's applied. Here's the result:

```
error = (20 - 352)2 / 1 = 110224 
```
The error is 110224, which is a gigantic number, since we are applying it to one data point and our model isn't trained yet. Now do the same for all the data points until you generate the error for the entire dataset. Hopefully, you will understand the process to calculate the error with that example.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
