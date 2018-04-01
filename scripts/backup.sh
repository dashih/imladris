#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'

if /usr/bin/mount | /usr/bin/grep /mnt/backup > /dev/null; then
    /usr/bin/rsync -avh --delete /home /mnt/backup/archive
else
    echo 'Backup disk(s) are not mounted. Aborting.'
fi

echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
