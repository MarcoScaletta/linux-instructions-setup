#!/bin/bash


echo 'UPDATING SYSTEM...'
sudo apt-get update
sudo apt-get upgrade -y 
sudo apt-get autoremove -y
echo ''
echo 'INSTALLING DEPENDENCIES...'
echo < dependencies
sudo  apt-get install < dependencies
echo ''
echo 'ADDING key4cats command to ~/ folder'
cp .key4cats_command.sh ~/.key4cats_command.sh
echo ''
echo 'cd to ./.. to download key4cats from github repo'
cd ..
git clone https://github.com/MarcoScaletta/key4cats.git

echo ''
echo 'get in key4cats folder'
cd key4cats/
echo ''
echo 'exporting KEY4CATs env var and command for key4cats to ~/.bash_profile'
echo "export KEY4CATs=$(pwd)/cats/build/libs/KeY4CATs.jar" > ~/.bash_profile
echo "source ~/.key4cats_command.sh" >> ~/.bash_profile
source ~/.bash_profile
echo "KEY4CATs=$KEY4CATs"
echo ""
echo "build jar"
./gradlew :cats:shadowjar
echo "cd sanity-check"
cd sanity-checks 
echo "START SANITY CHECKS"
source 1-check-evn-var.sh
source 2-check-command.sh
source 3-check-run-example.sh
