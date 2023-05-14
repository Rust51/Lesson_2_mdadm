#/bin/bash
mdadm --zero-superblock --force /dev/sd{b,c,d,e}
mdadm --create /dev/md1 -l 5 -n 4 /dev/sdb /dev/sdc /dev/sdd /dev/sde
if ! [ -d /etc/mdadm ]; then
mkdir /etc/mdadm
fi
mdadm --detail --scan --verbose |awk '/ARRAY/{print}'>> /etc/mdadm/mdadm.conf
