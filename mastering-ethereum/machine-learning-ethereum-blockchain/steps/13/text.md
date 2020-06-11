
Finally, here's the choose results function, which is quite lengthy because we must make sure that the job is open and that a winner has not been selected yet. If there are no winners selected after three days, the first applicant wins the reward to avoid losing Ether:

```
/// @notice To choose a winner by the sender
/// @param _id The id of the model
/// @param _arrayIdSelected The array index of the selected winner
function chooseResult(uint256 _id, uint256 _arrayIdSelected) public {
    Model memory m = models[_id];
    Model[] memory t = trainedModels[_id];
    require(m.isOpen, 'The job must be open to choose a result');
    // If 3 days have passed the winner will be the first one, otherwise the owner is allowed to choose a winner before 3 full days
    if(now - m.timestamp < 3 days) {
        require(msg.sender == m.owner, 'Only the owner can select the winner');
        t[_arrayIdSelected].owner.transfer(m.payment);
        models[_id].isOpen = false;
        emit SelectedWinner(_id, now, t[_arrayIdSelected].owner, t[_arrayIdSelected].id);
    } else {
        // If there's more than one result, send it to the first
        if(t.length > 0) {
            t[0].owner.transfer(m.payment);
            emit SelectedWinner(_id, now, t[0].owner, t[0].id);
        } else {
            // Send it to the owner if none applied to the job
            m.owner.transfer(m.payment);
            emit SelectedWinner(_id, now, msg.sender, 0);
        }
        models[_id].isOpen = false;
    }
}
```

The uploadJob function will be used by buyers to publish their dataset and payment in order to get their model trained by participants all over the world. The uploadResult function will be used by sellers to get information about a job to train the specified dataset until the error is minimized. Finally, the chooseResult function is the one that is used by buyers to select a winner proposal for a determined job. The creator of the job has three days to select a winning proposal. If after three days no one has applied, then the payment will be returned to the owner. If there are participants, but the owner hasn't selected a winner, the reward will be sent to the first participant in compensation for their speed; in that case, this function has to be executed by an external user to execute the payment.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
