#!/bin/bash

## Install Ninecraft

#----------------------------------#
#         INSTALL FUNCTION         #
#----------------------------------#

if [ -e /home/$(whoami)/.minecraft ]
then
    echo  ".minecraft folder exists"
    if [ -e /home/$(whoami)/.minecraft/minecraft.jar ]
    then
        echo  -ne "have you run this before?"
        dots
    
    fi
    echo ""
else 
    sudo apt-get install software-properties-common python-software-properties

    sudo add-apt-repository ppa:minecraft-installer-peeps/minecraft-installer

    sudo apt-get update

    sudo apt-get install minecraft-installer

    echo "Update Java to Java8"

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
fi  





