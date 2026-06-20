#!/bin/bash

sudo su
apt-get update && apt-get upgrade -y && apt-get autoremove -y

apt-get install git
apt-get install openjdk-21-jdk
apt-get install gradle

git clone https://github.com/MarcoScaletta/key4cats.git

cd key4cats/

echo "KEY4CATs=$(pwd)/cats/build/libs/KeY4CATs.jar" >> ~/.bashrc
echo "source ~/.key4cats_command.sh" >> ~./bashrc

cp .key4cats_command.sh ~/.key4cats_command.sh

source ~/.bashrc
echo $KEY4CATs

./gradlew :cats:shadowjar
