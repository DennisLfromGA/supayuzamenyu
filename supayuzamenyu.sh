#!/bin/bash -e
# exit if a pipeline returns a non zero status

# title           :supayuzamenyu.sh
# description     :a menu for installing and launching Ubuntu
# author          :ezzy.elliott@gmail.com
# date            :20160922
# bash version    :?
# crouton version :?

# Load crouton-crucial zip, unzip, delete zip.

# if any exit code is non-zero then bail out
set -o errexit

# complain helpfully
funcExit() {
# echo message in quotes to standard error
  >&2 echo "
$*
Usage: 
  $ sudo bash ./supayuzamenyu.sh
Summary:
  Set up chrome shell to use menu

  Must be in `shell` in `crosh`.

Examples:
  Set up menu
  $ sudo bash ~/Downloads/supayuzamenyu-master/supayuzamenyu.sh
"
  exit 1
}

