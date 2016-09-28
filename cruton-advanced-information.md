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
