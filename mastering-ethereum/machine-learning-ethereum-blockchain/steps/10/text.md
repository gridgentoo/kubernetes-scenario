Let's look at the smart contract marketplace to see how users will interact with it. Our goal is to provide a place where machine learning developers can upload their model with a payment in Ethereum with the aim of getting the solution from several sellers, from which a winner will be selected based on the error or the buyer's choice. Let's take a look at the following code:

```
pragma solidity 0.5.5;

contract MachineLearningMarketplace {}
```

We can start adding variables to create our desired application, as shown in the following code:

```
pragma solidity 0.5.5;

contract MachineLearningMarketplace {
    event AddedJob(uint256 indexed id, uint256 indexed timestamp);
    event AddedResult(uint256 indexed id, uint256 indexed timestamp, address indexed sender);
    event SelectedWinner(uint256 indexed id, uint256 indexed timestamp, address indexed winner, uint256 trainedIdSelected);

    struct Model {
        uint256 id;
        string datasetUrl;
        uint256 weight;
        uint256 bias;
        uint256 payment;
        uint256 timestamp;
        address payable owner;
        bool isOpen;
    }
    mapping(uint256 => Model) public models;
    mapping(uint256 => Model[]) public trainedModels;
    uint256 public latestId;
}
```

We've added three events to notify users that a new job or result has been added as well as when a winner for a proposal is selected. That way, people will be notified when their proposal gets updated. Then we have a struct named `Model` which represents our desired linear regression ML model with the dataset, weight, bias and payment among other important variables. Finally, we've added a couple of mappings to sort models created by buyers (those that pay to get their model trained) and those models created by sellers, those that train the model from the dataset and upload a specific weight and bias in order to win if they are selected by the buyer. latestId is an identifier to signify which model is the latest.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
