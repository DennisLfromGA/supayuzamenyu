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

funcDownload() {
  # download the crucial files zip to Download directory
  # simple progress bar
  # follow redirects
  # connect-tiomeout in 60 seconds
  # maximum for whole opertion 300 seconds
  # retry 2 times
  # output to crouton-crucial-master.zip
  if ! { umask 022 && \
    curl -# -L --connect-timeout 60 --max-time 300 --retry 2 "$CRUCIALFILES" -o \
      "$THISWORKINGDIR/crouton-crucial-master.zip"; }; then
    funcExit "Failed to download crouton-crucial-master.zip ."
  fi
  
  # unzip crouton-crucial-master.zip and delete zip file
  unzip ${THISWORKINGDIR}/crouton-crucial-master.zip -d $THISWORKINGDIR
  rm ${THISWORKINGDIR}/crouton-crucial-master.zip 
 }

funcMenuLink() {
  # make file executable
  chmod +x ${THISWORKINGDIR}/menu
  # create symbolic link to  menu to /usr/local/bin if does not exist
  cd /usr/local/bin
  [ ! -L menu ] && sudo ln -s ${THISWORKINGDIR}/menu .
}


# derive the supayuzamenyu installation dir
THISWORKINGDIR="$(dirname $0)"
echo "This is the working directory: "
echo $THISWORKINGDIR

# require the sample runcom

THISRCFILE="${THISWORKINGDIR}/supayuzamenyu.rc"
echo "This is rc file: "
echo $THISRCFILE

set -o xtrace
source $THISRCFILE
set +o xtrace


# Download crucial files and unzip
funcDownload
# create link to menu in /usr/local/bin
funcMenuLink





