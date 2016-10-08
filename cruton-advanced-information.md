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

# Running individual applications in windows and tabs
With xiwi installed, you do not need a desktop environment.  You can launch apps on an individual basis in a Chromium OS window or tab.

1. Enter your chroot to get a command line: `sudo enter-chroot`
2. Launch your app via the `xiwi` command: `xiwi gimp`
3. Use `xiwi -T gimp` to launch in a tab, or `xiwi -F gimp` to launch full-screen.
4. You can combine those into a single command `sudo enter-chroot xiwi -T gimp`.
5. You can silence output and run the command in the background via `sudo enter-chroot -b xiwi -T gimp`.

If your application forks and quits, xiwi may get confused and quit as well (you'll get an error/quit when the window launches).  Search your application's documentation for a parameter that prevents forking (oftentimes it's `-f`).  If you can't find one, you can pass `-f` to xiwi itself (e.g., `xiwi -f gvim`), and xiwi will not close unless there are no applications visible and you close the Chromium OS window. It's always better to use the appropriate options on the application's side of things if possible, though (`xiwi gvim -f` in this example).

You can pass parameters to your application like normal, but remember that if you use the combined form (e.g., `sudo enter-chroot xiwi gimp`), your current directory is ignored.  So even if you're in your Downloads folder and want to edit img.jpg, `sudo enter-chroot -b xiwi gimp ~/Downloads/img.jpg` is necessary.

Single-window applications work better than multi-window applications, but if you end up with multiple windows, you can switch between them via either the tabs at the top, or via the Ctrl+Alt+Tab and Ctrl+Alt+Shift+Tab keyboard shortcuts.  Ctrl+Alt+Shift+Escape acts the same as the close button on most windows.  If a pop-up window appears in a weird place, you can either drag-move it, or Alt+drag to resize it.

If you launch applications via aliases, the xiwi command will not know about them.  You can add the following snippet to your .bashrc/.zshrc to handle basic aliases:

```
# Wrap xiwi so that aliases work
xiwi() {
    local xiwiargs=''
    while [ "${1#-}" != "$1" ]; do
        xiwiargs="$xiwiargs $1"
        shift
    done
    local cmd="`alias "$1" 2>/dev/null`"
    if [ -z "$cmd" ]; then
        cmd="$1"
    else
        eval "cmd=${cmd#*=}"
        cmd="env $cmd"
    fi
    shift
    eval "/usr/local/bin/xiwi $xiwiargs $cmd \"\$@\""
}
```
ChromeOS can run a lot of Chrome processes. If you are working primarily in your crouton chroot, then this can place an excessive load on the system.

I've found that it is possible to kill a lot of these Chrome processes without doing anything damaging. These should be the ChromeOS chrome processes: <code>/opt/chrome/chrome/chrome</code>
Try this

  <pre>ps ax -o sess,pgrp,pid,cmd | awk '$4 ~ /\/chrome$/ { print $3 }' | xargs $nodo kill</pre>

PS: if you set a variable <code>nodo=echo</code> then it is a dry-run. 
