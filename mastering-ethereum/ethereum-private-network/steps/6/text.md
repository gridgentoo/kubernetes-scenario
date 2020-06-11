Press `Ctrl` + `C` to exit puppeth command prompt. To initialize your blockchain, execute the following command:

`geth --nousb --datadir .ethereum/ init new.json`{{execute}}

**Note:** You will need to update filenme in above command if you saved it with a differene name.

That will load the genesis blockchain state and start your private Ethereum blockchain. Make sure to add the `0x` prefix in front of your Ethereum address if you haven't already done so. Remember that the address is the one you created with the geth command earlier. It will ask you for your account's password, which you set up when you created it. Type it in and press Enter to unlock it. If you don't remember your password or your account, you'll have to go back to create a new account with the geth command and create a new genesis file with that address when asked.

That's about it! You now have a working private Ethereum blockchain with your own configuration parameters.