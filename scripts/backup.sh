#!/bin/sh

echo '---------- START -----------'
/bin/date
echo '----------------------------'
echo ''

if /usr/bin/mount | /usr/bin/grep /mnt/dannyshih_net_backup > /dev/null
then
    tmpDir=`mktemp -d`
    backupArchive="`echo $tmpDir | cut -d'.' -f2`.tar.gz"

    mariadb-dump --user=nextcloudbackup --lock-tables --databases nextcloud &> $tmpDir/nextcloud.sql

    mongodump --quiet --db=gas --username=gasbackup --password='KEYHtwFz@MCcE5nam8n6b3z#mjLbFhJGs@TnUn6#JUVHKWFJF9twKszjZHf2@rEfQpg4tLWMLajCCL9kvPrLxAWCy9Vi9VKxq9UEbgJ#n4MX5a8#u9YT' --out=$tmpDir

    mongodump --quiet --db=quotes --username=quotesbackup --password='R9N6j2Zb#28oeTSZ9CqR5KH$X2cHjJfWyc7M@4EVgUv7T@yGR' --out=$tmpDir

    tar -czf /mnt/dannyshih_net_backup/db-backups/$backupArchive --directory $tmpDir .
    rm -rf $tmpDir
    echo "Database backups archive: $backupArchive"

    echo -e '\n========\n'

    echo "Backing up gringotts..."
    rsync -avh /var/opt/gringotts-backups/ /mnt/dannyshih_net_backup/gringotts-backups

    echo -e '\n========\n'
    du -hs /mnt/dannyshih_net_backup
else
    echo 'Backup disk(s) are not mounted. Aborting.'
fi

echo ''
echo '----------- END ------------'
/bin/date
echo '----------------------------'

exit 0
