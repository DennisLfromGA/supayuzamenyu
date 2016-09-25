# supayuzamenyu - Advanced Crouton and Crucial Information

## Basic

* crouton is a set of scripts that bundle up into an easy-to-use, Chromium OS-centric chroot (guest OS environments like Ubuntu and Debian) generator.

* web [store page](https://goo.gl/OVQOEt) for crouton extension

* help text for installing crouton
```
sh ~/Downloads/supayuzamenyu-master/crouton/crouton
```

1. see list of crouton targets
```
sh ~/Downloads/supayuzamenyu-master/crouton/crouton -t help
```

2. see list of crouton supported releases such as debian and ubuntu
```
sh ~/Downloads/supayuzamenyu-master/crouton/crouton -r list
```

3. update all chroot targets for software updates
```
sudo sh ~/Downloads/supayuzamenyu-master/crouton/crouton -u -n chrootname
```

4. backup chroot to timestamped tarball
```
sudo edit-chroot -b chrootname
```

5. restore chroot from most recent timestamped tarball
```
sudo edit-chroot -r chrootname
```

6. use crouton to restore specific tarball if chromebook power washed
```
sudo sh ~/Downloads/crouton -f mybackup.tar.gz
```

7. use `T` parameter to use your own target files

8. delete a chroot with either of theses commands
```
sudo delete-chroot evilchroot
```
or
```
sudo edit-chroot -d evilchroot
```

