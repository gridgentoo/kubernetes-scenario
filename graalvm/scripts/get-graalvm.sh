#! /bin/bash/sh
#
#This script is meant for quick & easy install via 
# $ curl -fsSL https://raw.githubusercontent.com/nelvadas/katacoda-scenarios/master/graalvm/scripts/get-graalvm.sh -o get-graalvm.sh
# $ sh get-graalvm.sh

JDK_VERSION=${JDK_VERSION:-11}
GRAAL_VERSION=${GRAAL_VERSION:-20.1.0}
curl -L -o /tmp/graalvm-ce.tar.gz https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/graalvm-ce-java${JDK_VERSION}-linux-amd64-${GRAAL_VERSION}.tar.gz
tar -C /opt/ -xf /tmp/graalvm-ce.tar.gz
export PATH=/opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}/bin:$PATH

# Install Maven 
apt update
apt-get install -y maven

# Customize PATH and bashrc
echo "export PATH=/opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}/bin:$PATH">> ~/.bashrc
echo "export GRAAL_VERSION={GRAAL_VERSION}" >> ~/.bashrc
echo "export JAVA_HOME=/opt/graalvm-ce-java${JDK_VERSION}-${GRAAL_VERSION}" ~/.bashrc

source ~/.bashrc

# Environment Available
echo "GraalVM ${GRAAL_VERSION} for JDK ${JDK_VERSION} is now up and running  ..............."
echo "Maven is up and Running "


