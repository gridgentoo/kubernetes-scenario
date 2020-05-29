[zeppelinn](https://zeppelin.apache.org/)

[spark](https://spark.apache.org/)


tutorial https://zeppelin.apache.org/docs/0.5.5-incubating/tutorial/tutorial.html

Jump to the Zeppelin page and enter the following and press the PLAY icon.

`%sh
wget http://archive.ics.uci.edu/ml/machine-learning-databases/00222/bank.zip`

You should see the download status being displayed. This is a 45,000 account info.

Now unzip the file

`unzip bank.zip`

`%sh
mkdir yourPath
mkdir yourPath/bank
cp bank-full.csv yourPath/bank/bank-full.csv`

`%sh ls -lash yourPath/bank/bank-full.csv`

`%sh wc -l yourPath/bank/bank-full.csv`


WIP: do we need to be in workdir for correct exec of cmds?