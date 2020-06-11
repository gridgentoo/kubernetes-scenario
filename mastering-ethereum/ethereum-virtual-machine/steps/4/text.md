If you compile the contract to bytecode and analyze the process that the bytecode is taking, you will get the following:
`solcjs Example.sol --bin`{{execute}}


You'll see a few interesting things about the EVM's behavior. First off, you'll get a file with the .bin termination, such as `Example_sol_Example.bin`, which is the binary file containing the compiled bytecode of the smart contract:
`cat Example_sol_Example.bin`{{execute}}


```
60806040526003600055348015601457600080fd5b5060358060226000396000f3fe6080604052600080fdfea165627a7a72305820aa17e74115b5e066ae13d560c624e9abef54adbce68c3443886eadc4e1059cfe0029
```

To understand all that bytecode and see what the EVM is really doing, we have to split each instruction accordingly. 6080604052 is just the initialization of the smart contract. It's always the same for every contract. Then, we have the following:

```
60 03
```

The number 60 is a specific instruction, known as PUSH, that essentially moves the number 3 to the memory stack. The stack is just an empty array that can get or delete values from its array. Our stack looks like this after the PUSH 3 instruction:

```
stack: [3]
The following instruction adds a zero to the stack:

```
60 00
This results in stack: [0, 3].

Then, we have 55, which is a STORE instruction that writes uint256 permanently to storage, the blockchain. We need to add the number 3 to the stack before we can write it into storage. What we did here is essentially the following:

```
uint256 myNumber = 3;

```

This is equivalent to the following:
```
6003600055
```

