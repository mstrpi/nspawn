#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
	echo "Please run as root..."
	sleep 2 && exit
fi

echo "Greetings! This will install the proper files to run the
scripts which will help get systemd-nspawn containers up and
running. Feel free to review the packages currently set to install
by default and add or remove as necessary.
"
sleep 3
sudo cp ./bin/* /usr/local/bin/
echo -e "Installing..... and...
"
sleep 1
echo " ...That's it! Go ahead and run one of the following commands to get started.

	'sudo narch'
	'sudo ndebian'
	'sudo nfedora'
	'sudo nubuntu'

Enjoy!
"
sleep 3
exit
