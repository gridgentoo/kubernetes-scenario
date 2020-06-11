Geth is also capable of mining Ether on its own using your CPU, which is not an efficient process compared to alternatives such as mining with your graphic cards or with Application-specific integrated circuits (ASICs). Nevertheless, its addition to this tool may be useful in different situations where low-resource mining is required, such as with IoT devices.

To mine with Geth, execute the following command:
`geth --mine`{{execute}}

It will start downloading and synchronizing your chain if it's not synchronized already. You'll be able to receive funds after you set up your etherbase, which can be easily done as follows:
`geth --etherbase 0`{{execute}}

The last number indicates which account will be used from your list. You can see your accounts with the geth account list command.