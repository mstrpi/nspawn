#systemd-nspawn for fedora base containers
ctname=
btrfs subvolume create /var/lib/machines/${ctname}
{ echo "[centos8-chroot-base]" ; echo "name=CentOS-8-Base" ; echo "baseurl=http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/" ; echo "gpgcheck=1" ; echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial": echo "[centos8-chroot-appstream]"; echo "name=CentOS-8-stream-AppStream"; echo "baseurl=http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/"; echo "gpgcheck=1"; echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial"; echo "[epel8-chroot]"; echo "name=Epel-8"; echo "baseurl=https://ftp.halifax.rwth-aachen.de/fedora-epel/8/Everything/x86_64/"; echo "gpgcheck=1"; echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8"; echo ; } >> /root/centos8.repo
dnf install http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/centos-gpg-keys-8-2.el8.noarch.rpm
rpm -Uvh --nodeps https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf -c /root/centos8.repo --releasever=8-stream --best  --disablerepo=*    --setopt=install_weak_deps=False --enablerepo=centos8-chroot-base --enablerepo=centos8-chroot-appstream --enablerepo=epel8-chroot --installroot=/var/lib/machines/${ctname}  install  centos-release dhcp-client dnf glibc-langpack-en glibc-langpack-de  iproute iputils less passwd systemd  systemd-networkd  vim-enhanced curl wget openssh-server  dbus-broker sudo
setenforce 0
systemd-nspawn -D /var/lib/machines/${ctname} passwd
#setenforce 1
### make sure ot set hostname inside container
