# supayuzamenyu - Advanced Crouton and Crucial Information

## Basic

* crouton is a set of scripts that bundle up into an easy-to-use, Chromium OS-centric chroot (guest OS environments like Ubuntu and Debian) generator.

* web [store page](https://goo.gl/OVQOEt) for crouton extension


* help text for installing crouton
```
sh ~/Downloads/supayuzamenyu-master/crouton/crouton
```

* see list of crouton targets
```
sh ~/Downloads/supayuzamenyu-master/crouton/crouton -t help
```

* see list of crouton supported releases such as debian and ubuntu
```
sh ~/Downloads/supayuzamenyu-master/crouton/crouton -r list
```

* update all chroot targets for software updates
```
sudo sh ~/Downloads/supayuzamenyu-master/crouton/crouton -u -n chrootname
```

* backup chroot to timestamped tarball
```
sudo edit-chroot -b chrootname
```

* restore chroot from most recent timestamped tarball
```
sudo edit-chroot -r chrootname
```

* use crouton to restore specific tarball if chromebook power washed
```
sudo sh ~/Downloads/crouton -f mybackup.tar.gz
```

* use `T` parameter to use your own target files

* delete a chroot with either of theses commands
```
sudo delete-chroot evilchroot
```
or
```
sudo edit-chroot -d evilchroot
```

## Common
This isn't a real target; it's the boilerplate that the other targets source.
The targets are simply sourced inside of install.sh, and so can expect to have
access to all all-caps variables (by convention; not a technical restriction).

Additionally, this common script expects the sourcing script to set
DESCRIPTION with the description of the target, and REQUIRES with a
space-separated list of other targets it needs.

The script can also specify a space-separated list of targets in PROVIDES;
this will prevent other targets from installing when this one is done first.

Finally, targets can set HOSTBIN, CHROOTBIN, and CHROOTETC with a
space-separated list of files to copy from host-bin, chroot-bin, and
chroot-etc into the appropriate places.

All targets must be idempotent since the user may Ctrl-C the process and run
it again.

## Learn to talk to Crouton

* List **targets** (``-t``): ``sh ~/Downloads/crouton -t help``  
or `sh ~/Downloads/crouton -t list`
* List supported Linux **releases** (``-r``): ``sh ~/Downloads/crouton -r list``  
* List all installed **chroot names** (``-a``): ``sudo edit-chroot -a``  
* List all installed **chroot names with croutonversion** (``-al``): ``sudo edit-chroot -al``  
* Check the crouton **version** (must run *within* a chroot): ``croutonversion -u -c`` (run ``croutonversion -h`` for more info)  
* **Update** a chroot: ``sudo sh ~/Downloads/crouton -u -n chrootname``. Note: this will update crouton and all installed targets. 
* **Update** a chroot while adding new target(s): ``sudo sh ~/Downloads/crouton -u -n chrootname -t targets_you_want_to_install_separated_by_commas``   
* **Backup** a chroot to an SD Card: ``sudo edit-chroot -f /media/removable/SD\ Card/ -b chrootname`` (assumes the name of your SD Card is "SD Card")
* **Backup** a chroot to a USB drive: ``sudo edit-chroot -f /media/removable/your_path_on_drive -b chrootname`` 
* **Restore** from a backup: ``sudo edit-chroot -f /media/removable/your_path_on_drive -r chrootname``
* Learn more about edit-chroot (i.e., man page): ``edit-chroot``
* **Delete** a chroot: ``sudo delete-chroot name_of_evilchroot``
* **Rename** a chroot: ``sudo edit-chroot source -m destination`` 
* **Switch** between xorg and xiwi if both installed: ``sudo startxfce4 -X xiwi`` or ``sudo startxfce4 -X xorg`` (replace ``startxfce4`` with your interface shortcut from the setup). Samsung ARM users will need to use ``xephyr`` instead of ``xorg``.
* **Mount** a chroot and enter the 'shell': ``sudo enter-chroot -n chrootname`` (run ``mount-chroot`` for more info)
* **Unmount** a chroot: ``sudo unmount-chroot chrootname`` (run ``unmount-chroot`` for more info). Using the -f switch can be helpful for freeing up orphaned processes from 'xiwi -T' apps that mounted in the background using the 'enter-chroot -b' background exec.
* **Launch a single app in a Window** in the background<sup>[1](#myfootnote1)</sup>: ``sudo enter-chroot -b -n chrootname xiwi app_name`` (e.g., ``xiwi xterm``)
* **Launch a single app in a Tab**: ``sudo enter-chroot -n chrootname xiwi -T app_name`` (e.g., ``xiwi -T xterm``) 

_Notes_
* Think of some notations as variables in an equation. For example, substitute the name of your chroot for ``chrootname`` or ``name_of_evilchroot``. 
* Similarly, ``source`` is the name of the source chroot that you want to change, and ``destination`` is the new name of a chroot. 
* Use the ``-f`` switch to define the path. The user download directory is ``~/Downloads`` and an external drive begins ``/media/removable/``. To check your path, use ``cd`` and ``ls`` from within the shell. For example, enter ``cd /media/removable/`` and then ``ls`` to check. 
* To run a chroot in a window you need the [browser integration extension](https://chrome.google.com/webstore/detail/crouton-integration/gcpneefbbnfalgjniomfjknbcgkbijom) and you must install ``-t xiwi``. To run the old fashioned way, you need  ``-t xorg`` (or ``xephyr`` on Samsung ARM). To switch between the two, see above. 
* Once you mount a chroot (see above) you can update and install packages. Stay away from the Ubuntu Software manager, and use the command line. See Ubuntu's [AptGet/Howto](https://help.ubuntu.com/community/AptGet/Howto). 

<a name="myfootnote1">1</a>: When using the 'xiwi-app', if the Linux app that is being launched forks (to the background) - use the 'xiwi' ``-f`` option to keep xiwi running until all windows are closed. For more info, please see [this page](https://github.com/dnschneid/crouton/wiki/crouton-in-a-Chromium-OS-window-%28xiwi%29) in the Wiki.
 
Remember that you can copy and paste in the shell with Ctrl+Shift+C and Ctrl+Shift+V. For a bonus, try the up arrow key, the next time you're in the shell. 
