#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'
echo ''

if /usr/bin/mount | /usr/bin/grep /mnt/nas > /dev/null
then
    rsync -avh --no-owner --no-group --no-perms --delete --progress /mnt/raid/ /mnt/nas
else
    echo 'NAS not mounted. Aborting.'
fi

echo ''
echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
