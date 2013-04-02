iptablesfs
==========

iptablesfs is an easy, intuitive, filesystem-based interface to managing your iptables firewall on Linux. Protecting your server or workstation is as easy as this:

1) Run the installer. This copies the "firewall" shell script to /etc/init.d/ and creates a symlink into /etc/rcS.d/ so that the firewall is started on boot.
2) Run "/etc/init.d/firewall setup" to create the configuration directory.
3) If you don't want to reboot, just run "/etc/init.d/firewall start".

This will block all incoming packets except for those which belong to established connections.

Adding rules:

Want to add access to HTTPS from anywhere on the Internet?
echo ANY_IP > /etc/firewall/eth0/tcp/443

Want to add access to HTTP from your home and work IP address ranges?
echo homeaddress > /etc/firewall/eth0/tcp/80
echo 172.16.80.1-20 >> /etc/firewall/eth0/tcp/80

DNS?
echo ANY_IP > /etc/firewall/eth0/udp/53
echo homeaddress > /etc/firewall/eth0/tcp/53

Allow ICMP ECHO REQUESTs from your home address but nowhere else?
echo homeaddress > /etc/firewall/eth0/icmp/echo-request

Allow access to SSH only from a specific source port at home?
echo homeaddress:50022 > /etc/firewall/eth0/tcp/22

Just remember when you have finished your configuration changes to apply them with:
/etc/init.d/firewall restart

NOTES
-----
Source addresses can be provided in any format iptables understands. It is bad security practice to use hostnames which require DNS lookups to resolve. It's OK to use hostnames which are in your /etc/hosts file.

If you're installing this on a remote server over SSH, MAKE SURE YOU ADD A RULE to let you get back in once your established connection has been terminated:
echo $(echo $SSH_CLIENT | awk {print'$1'}) > /etc/firewall/eth0/tcp/22 && /etc/init.d/firewall restart













