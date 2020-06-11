
Those are the main components that make our ML marketplace work; however, we need a few functions to help people interact with it. Here are the new functions that are added to the ML marketplace broken down in pieces to help you understand them better.

First, we create the cost function with complete documentation so that we can understand what it's doing:

```
/// @notice The cost function implemented in solidity
/// @param _results The resulting uint256 for a particular data element
/// @param _weight The weight of the trained model
/// @param _bias The bias of the trained model
/// @param _xs The independent variable for our trained model to test the prediction
/// @return int256 Returns the total error of the model
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

Second, we have the get model function to retrieve the variables contained in the struct model because we can't return the struct as it is right now. We have to make these types of tricks to get the struct values independently. This function is shown in the following code:

```
/// @notice To get a model dataset, payment and timestamp
/// @param id The id of the model to get the dataset, payment and timestamp
/// @return Returns the dataset string url, payment and timestamp
function getModel(uint256 id) public view returns(string memory, uint256, uint256) {
    return (models[id].datasetUrl, models[id].payment, models[id].timestamp);
}
```

Third, we add another getter function that gives us all the trained models for a particular ID, as shown in the following code. This is useful for sellers who want to see what proposals they got for their particular job. If we were to implement this machine learning marketplace in a dApp, we'd have to add a few more getters for the jobs and other mappings:

```
/// @notice To get all the proposed trained models for a particular id
/// @param _id The id of the model created by the buyer
/// @return uint256[], uint256[], uint256[], uint256[], address[] Returns all those trained models separated in arrays containing ids, weights, biases, timestamps and owners
function getAllTrainedModels(uint256 _id) public view returns(uint256[] memory, uint256[] memory, uint256[] memory, uint256[] memory, address[] memory) {
    uint256[] memory ids;
    uint256[] memory weights;
    uint256[] memory biases;
    uint256[] memory timestamps;
    address[] memory owners;
    for(uint256 i = 0; i < trainedModels[_id].length; i++) {
        Model memory m = trainedModels[_id][i];
        ids[i] = m.id;
        weights[i] = m.weight;
        biases[i] = m.bias;
        timestamps[i] = m.timestamp;
        owners[i] = m.owner;
    }
    return (ids, weights, biases, timestamps, owners);
}
```

We have a cost function to quickly verify the results uploaded by a proposed seller, a getModel function that will be mainly used by sellers who want to get more specific information about a model and a getAllTrainedModels function that returns the participants of a particular job. Note how we're returning the most important variables in the struct instead of the entire struct. We are doing this for the simple reason that we can't return structs yet in Solidity so we have to separate each variable and return an array for each.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
