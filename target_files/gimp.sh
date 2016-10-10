#!/bin/bash

#Install gimp

sudo apt-get install software-properties-common python-software-properties
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get update && sudo apt-get install gimp