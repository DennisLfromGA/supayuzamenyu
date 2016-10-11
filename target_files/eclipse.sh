#!/bin/bash

# install eclipse

wget -O "eclipse-inst-linux64.tar.gz" "http://eclipse.bluemix.net/packages/neon.1/data/eclipse-inst-linux64.tar.gz"
tar xf eclipse-inst-linux64.tar.gz
cd eclipse-installer
echo "choose home directory to install"

chmod a+x eclipse-inst
./eclipse-inst

