#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'

if /usr/bin/mount | /usr/bin/grep /mnt/dannyshih_net_backup > /dev/null
then
    newdbFileName="`openssl rand -hex 12`.sql.gz"
    newdbFile="/mnt/dannyshih_net_backup/nextcloud-db-backups/$newdbFileName"
    mariadb-dump --user=nextcloudbackup --lock-tables --databases nextcloud | gzip -9 &> $newdbFile
    echo "Nextcloud database backup: $newdbFileName"

    echo -e '\n========\n'

    rsync -avh /home/dss4f/gas/ /mnt/dannyshih_net_backup/gas
    rsync -avh /home/dss4f/gringotts-backup/ /mnt/dannyshih_net_backup/gringotts-backup

    echo -e '\n========\n'
    du -hs /mnt/dannyshih_net_backup
else
    echo 'Backup disk(s) are not mounted. Aborting.'
fi

echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
