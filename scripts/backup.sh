#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'

if /usr/bin/mount | /usr/bin/grep /mnt/backup > /dev/null; then
    /usr/bin/rsync -avh /home /mnt/backup
else
    echo 'Backup disk is not mounted. Aborting.'
fi

echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
