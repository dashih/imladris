#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'
echo ''

if /usr/bin/mount | /usr/bin/grep /mnt/nas > /dev/null
then
    rsync -avh --no-owner --no-group --no-perms --delete --progress /mnt/raid/ /mnt/nas
    echo -e '\n----------------------------\n'
    ssh -i /home/dss4f/.ssh/id_ed25519 root@192.168.1.64 'mdadm --detail /dev/md2'
    echo -e '\n----------------------------\n'
    mdadm --detail /dev/md127
else
    echo 'NAS not mounted. Aborting.'
fi

echo ''
echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
