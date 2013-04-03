#!/bin/bash

if [ `id -u` -ne 0 ]; then
	echo "This package must be installed by root!"
	exit 1
fi

cp firewall /etc/init.d/firewall
chmod 544 /etc/init.d/firewall

ln -fs /etc/init.d/firewall /etc/rcS.d/S15firewall

#cp fwconfig /usr/local/sbin
#chmod 544 /usr/local/sbin/fwconfig


