# This file is part of Lanradio.
#
# Lanradio is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Lanradio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Lanradio.  If not, see <http://www.gnu.org/licenses/>.
#
# Authors:
# Florian Klingler <klingler@ccs-labs.org>

#!/bin/bash

interface=eth1-apus

#
# If you encounter errors, e.g., Permission denied accessing the TFTP directory, ensure that APPARMOR, or SELINUX is not blocking access to the directories
#

set -e
set -x

sudo ifconfig $interface down
sudo ifconfig $interface up 10.0.197.200

sudo iptables -I INPUT 1 -i $interface -j ACCEPT

curr_dir=$(pwd)
my_userid=$USER

sudo dnsmasq -p 0 -i $interface -d -K --log-dhcp --bootp-dynamic -z --dhcp-range=10.0.197.1,10.0.197.100,255.255.255.0,1h --dhcp-boot=pxelinux.0,pxeserver,10.0.197.200 --pxe-service=x86PC,"Lede",pxelinux --enable-tftp --tftp-root=$curr_dir --leasefile-ro --tftp-secure --user=$my_userid
