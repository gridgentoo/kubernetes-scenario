Before getting straight to the code, I want you to understand the process that we'll follow to optimize the entire process, avoid confusion, and save time by avoiding bugs with a clear head about what needs to be done. The process looks like so:

- Create a smart contract file and write in the comments a description of the purpose of the contract, such as how the functions will work and who will use it. Be as concise as possible since it will help you and the maintainers understand what it is all about.
- Start creating variables and function signatures, that is, functions without body, just the name and parameters. Document each function using the NatSpec format for additional clarifications.
- Start implementing each function independently until all of them are done. You can add more if you need to.
- Manually test the contract by copy pasting it to remix or any other IDE to quickly find problems and run all the functions in a virtual EVM where you don't have to pay any gas or wait for confirmations. Ideally, you'd write Truffle tests to verify that everything is working, but sometimes it can be skipped to save time.
Here's a graphic of the process so you can keep it in mind:

![](https://github.com/fenago/katacoda-scenarios/raw/master/mastering-ethereum/blockchain-based-social-media-platform/steps/11/process.JPG)
