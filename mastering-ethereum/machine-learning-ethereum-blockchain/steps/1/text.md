# Blockchain and AI Overview
## Possibilities
Blockchain and AI have been the most interesting topics in recent years for a good reason: they are the most advanced technologies that have been created to disrupt most established businesses. The fact that we can teach a computer to learn by itself is something very powerful and means that the machine learning systems of the future will continue to evolve. Likewise with blockchain, the field of distributed computing is just beginning, and it will be the default solution for most problems in the future. So why not combine both for a revolutionary invention? It turns out that they work nicely together and we can create very interesting dApps that benefit from both worlds, particularly by using them to create decentralized marketplaces for solving machine learning problems that reward users for their computing power.

In this scenario, we're going to cover the following topics:

- Understanding machine learning
- Decentralized machine learning marketplaces
- Building a smart contract machine learning marketplace

## Decentralized machine learning marketplaces
We are going to build a marketplace to buy and sell computing power from users that have strong GPUs and want to help others perform machine learning to teach their algorithms to complete a task based on supervised learning where a program learns to generate a desired output from a large quantity of input given a goal so that it programs itself.

Ethereum comes into the equation when we need to deal with storing permanent records of the transactions that took place in our ML marketplace along with the trained model that the buyer requested from their parameters so that it's accessible anytime. The idea is to create a place where people from all around the world can start earning money from a new use of their hardware as an alternative to mining while also providing a secure system for ML algorithms.

**_We will use GPUs to train our machine learning programs because they are great at processing lots of parallel operations at the same time so that we can go through large batches of input quickly, faster than with a CPU. We'll also use Ethereum as the default payment currency to process decentralized transactions with ease._**

Most machine learning models nowadays are based on neural networks (NN), which are abstractions of how a human brain works, translated to computers. It's based on virtual individual neurons that receive an input and produce an output if a condition is met. For instance, say that a simple neuron contains the following statement:


`if(input > 10) return output = true;`

The statement will return a positive value if the input is larger than 10. That function is what's called an activation function which makes sense because it will activate if the function fulfills the conditions. We can combine many of those neurons together with different parameters and configurations to get what's known as a neural network which processes complex input to generate precise output. When training, we're readjusting the activation function to better adapt to our desired goal. This is all done automatically once it's set up in our model. At the end, we get a trained program that is capable of answering complex questions without having to code each specific scenario.

Once the model is adjusted from our training dataset, we can test it with a new input from a different source to determine whether it's generating an optimal output. This is important since there's a risk of overfitting where the machine learning program optimizes too much, becoming too specific to our initial input, which makes it unable to produce valid results from new data. It's like a surgeon that has to become a general doctor from scratch: it won't produce great results because it's too specialized.

## Our Use Cases
There are two obvious AI and Blockchain Use Cases:
1. Using blockchain data to make predictions related to things such as associating real identities with wallets
2. Creating marketplaces.  

**_We are going to look at the use case of how to create a marketplace._**
We won't use NNs here as they are harder to implement from scratch on Solidity because of the limitations of the blockchain, so we'll work with simpler algorithms that you can expand as you need. 
Here's how our protocol will work:

1. A user publishes a set of data, an evaluation function (our ML model), and the reward for completing the task to the smart contract in ETH.

2. Those that want to fulfil the task will download the published data from the first user to train the given ML model in order to generate a trained program that will be given back to the smart contract.

3. External users will take a look at all the published solutions for that particular task to determine who is the winner. The buyer will determine the winner based on their preference. 

**From this protocol, we can establish the following process that the users will follow:**

1. A buyer, someone who wants their model trained, deploys a smart contract that contains the following data:
- Their model definition in the constructor—for instance, DNN.
- The datasets to train—for instance, an array of handwritten digit images made of 30 x 30 pixels. Each image is an array of 30 x 30 pixels (900 pixels) where each pixel is another array containing information about the position of the pixel and whether it's black or white (we don't want colors in this image to avoid complexity)—for instance [[0, true], [1, false]] will represent a 2 x 1 pixel image where the first pixel is black while the other is white. This dataset will be published to an external website that people can freely access to train the model. In our constructor we will provide a URL, namely https://example.com/dataset.
- The reward for training the model is paid in Ethereum, and this arrangement set up in the payable constructor.
2. The contract is published and sellers begin to participate in the task of training the model. From the dataset, 90% of the data will be used to train the model while the remaining 10% will be used to test the results from the program to verify its accuracy. To make sure sellers don't copy each other, different random datasets will be given to different participants.
3. The buyer decides which model works best for them and selects a winner. If an expiration time is reached and the buyer hasn't selected a winner, the first participant will get the reward.
**
For our machine learning marketplace, we'll use a simple linear-regression machine learning algorithm in Solidity. Users will submit their data, which will contain a name and two number parameters to make predictions. A linear regression is a relationship between two factors—for instance, the number of sales in a website and the number of visitors. In that case, we can establish a model that allows us to predict the number of sales for a given number of visitors.

Simple linear-regression models can be applied to many fields where a variable depends on another, and it's one of the simplest machine learning systems available. That's why we'll be using it, since it's important to be able to recreate it in Solidity to verify solutions provided by other users. Ideally, we'd implement an NN or a more complex model, but that would take too much time to develop considering the limitations of the blockchain. You can build upon the lessons in this chapter to extend the marketplace. In the following section, you'll learn how to create the code required for the marketplace.

Grincalaitis, Merunus. Mastering Etheruem. Packt, 2019.
