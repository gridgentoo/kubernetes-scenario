Let's move on to the three most important functions of our ML marketplace. The upload job function looks like the following:

```
/// @notice To upload a model in order to train it
/// @param _dataSetUrl The url with the json containing the array of data
function uploadJob(string memory _dataSetUrl) public payable {
    require(msg.value > 0, 'You must send some ether to get your model trained');
    Model memory m = Model(latestId, _dataSetUrl, 0, 0, msg.value, now, msg.sender, true);
    models[latestId] = m;
    emit AddedJob(latestId, now);
    latestId += 1;
}
```

Here's the upload results function, with some added documentation to clarify the parameters used inside:

```
/// @notice To upload the result of a trained model
/// @param _id The id of the trained model
/// @param _weight The final trained weight, it must be with 10 decimals meaning that 1 weight is 1e10 so that you can do smaller fractions such as 0.01 which would be 1e8 or 100000000
/// @param _bias The final trained bias, it must be with 10 decimals as the weight
function uploadResult(uint256 _id, uint256 _weight, uint256 _bias) public {
    Model memory m = Model(_id, models[_id].datasetUrl, _weight, _bias, models[_id].payment, now, msg.sender, true);
    trainedModels[_id].push(m);
    emit AddedResult(_id, now, msg.sender);
}
```
Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
