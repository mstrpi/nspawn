#systemd-nspawn for debian base containers
ctname=nginx
btrfs subvolume create /var/lib/machines/${ctname}
debootstrap --include=dbus-broker,systemd-container,systemd,util-linux,passwd,nano,sudo,vim,curl,wget,openssh-server --components=main,universe jammy /var/lib/machines/${ctname} http://archive.ubuntu.com/ubuntu
setenforce 0
systemd-nspawn -D /var/lib/machines/${ctname} passwd
setenforce 1
