#!/bin/bash

# install git

sudo apt install git

echo "Type your chosen git email address then [ENTER]:"
read EMAILADDRESS
git config --global user.email "${EMAILADDRESS}"
echo "Type your name then [ENTER]:"
read YOURNAME
git config --global user.name "${YOURNAME}"