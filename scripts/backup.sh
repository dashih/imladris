#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'

if /usr/bin/mount | /usr/bin/grep /mnt/dannyshih_net_backup > /dev/null; then
    /usr/bin/rsync -avh --delete --exclude '*Maildir*' --exclude '*mail_data*' --exclude '*.git*' /home /mnt/dannyshih_net_backup
    echo '========'
    /usr/bin/du -hs /mnt/dannyshih_net_backup
else
    echo 'Backup disk(s) are not mounted. Aborting.'
fi

echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
