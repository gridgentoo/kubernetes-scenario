# Installs Kafka under the $HOME folder
# Location of binaries => $HOME/kafka/bin

# Update
apt-get update

apt-get install telnet

# Install JRE
 apt-get --assume-yes install default-jre

# Install Zookeepr
 apt-get --assume-yes install zookeeperd
# Stop zookeeper and prevent it from auto starting
 service zookeeper stop
 systemctl remove zookeeper

# Create a temp directory
mkdir $HOME/kafka
cd $HOME/kafka
#wget http://apache.claz.org/kafka/1.1.0/kafka_2.12-1.1.0.tgz -O kafka.tgz
# wget http://www-us.apache.org/dist/kafka/1.1.0/kafka_2.12-1.1.0.tgz
# Updated v1.3-3
#wget http://www-us.apache.org/dist/kafka/1.1.1/kafka_2.12-1.1.1.tgz

wget http://www-us.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz

mv *.tgz  kafka.tgz

# Untar & delete tar file
tar -xvzf ./kafka.tgz --strip 1
rm kafka.tgz


# Launches Kafka server

# Start the zookeeper
 service zookeeper start

# Give time for zookeeper to launch
sleep 3s

# Start the kafka
nohup $HOME/kafka/bin/kafka-server-start.sh $HOME/kafka/config/server.properties > $HOME/kafka.log 2>&1 &

echo "Check logs for errors - $HOME/kafka.log"
echo "Done."