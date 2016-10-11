#!/bin/bash

# install eclipse

wget -O "eclipse-inst-linux64.tar.gz" "http://eclipse.bluemix.net/packages/neon.1/data/eclipse-inst-linux64.tar.gz"
tar xf eclipse-inst-linux64.tar.gz
cd eclipse-installer

chmod a+x eclipse-inst
sudo ./eclipse-inst

