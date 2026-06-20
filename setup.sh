#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y 
sudo apt-get autoremove -y

sudo  apt-get install < dependecies

cp .key4cats_command.sh ~/.key4cats_command.sh
cd ..
git clone https://github.com/MarcoScaletta/key4cats.git
cd key4cats/
cd key4cats/ 
echo "export KEY4CATs=$(pwd)/cats/build/libs/KeY4CATs.jar" > ~/.bash_profile
echo "source ~/.key4cats_command.sh" >> ~/.bash_profile
source ~/.bash_profile
echo $KEY4CATs
/gradlew :cats:shadowjar
