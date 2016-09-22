# supayuzamenyu
Chromebook and box quick and easy menu for installing and launching Ubuntu (using Crouton and Crucial)

It uses [Crouton](https://github.com/dnschneid/crouton), the Chromium OS universal chroot environment and [crouton-crucial](https://github.com/qrkourier/crouton-crucial), Helper scripts for Crouton

## Advantages
* easy to launch Ubuntu windows or environments
* easy to install Ubuntu windows or environments
* easy to delete Ubuntu environments

## Bootstrapping
* enter developer mode (see [developer mode](./developer_mode.md))
* download and unpack [the zip file](https://github.com/ezzye/supayuzamenyu/archive/master.zip)
* press ctrl-alt-t to open a crosh terminal see [10+ Commands Included In Chrome OS’s Hidden Crosh Shell](http://www.howtogeek.com/170648/10-commands-included-in-chrome-oss-hidden-crosh-shell/)
* invoke bash as root (see example below)
* example
```
crosh> shell
```
* run Crucial and bootstrap Crouton
```
$ sudo bash ~/Downloads/supayuzamenyu-master/supayuzamenyu.sh
```
