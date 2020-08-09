In the **fourth** command-line terminal, start up the processing engine. From the project root directory (where the gradle jar command were executed) run this command:

`cd ~/kafka/Chapter03/monedero && java -jar ./build/libs/monedero-0.1.0.jar localhost:9092 foo input-topic valid-messages invalid-messages`{{execute T4}} 