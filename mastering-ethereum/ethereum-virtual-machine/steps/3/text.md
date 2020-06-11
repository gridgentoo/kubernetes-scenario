Smart contracts are fascinating because they are able to keep many nodes connected in a single system that understands how they should make decisions and agree on the results. They work on top of a stack-based virtual machine that you could think of as an array that keeps track of the variables stored in memory. It provides you with a set of small functions to manipulate that stack. To understand how smart contracts operate in the EVM, we'll have to follow them to see how they are being transformed by the virtual machine until they become executable bytecode.

For instance, take a simple contract such as this one:

<pre class="file" data-filename="Example.sol" data-target="replace">
pragma solidity ^0.6.1;

contract Example {
    uint256 myNumber = 3;
}
</pre>


How does a compiler such as solc convert that code into something that the EVM can understand so that the computer can process it? Let's try to analyze it with that specific compiler. Install solc by executing the following command:
`npm i -g solc`{{execute}}
