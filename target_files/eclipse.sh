#!/bin/bash

# install eclipse

wget -q "https://www.eclipse.org/downloads/download.php?file=/oomph/epp/neon/R1/eclipse-inst-linux64.tar.gz&mirror_id=1190"
tar xf eclipse-inst-linux64.tar.gz
cd eclipse-installer
echo "choose home directory to install"

chmod a+x eclipse-inst
./eclipse-inst

