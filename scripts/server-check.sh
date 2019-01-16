#!/bin/sh

echo '*********************'
echo '* Checking services *'
echo '*********************'
/bin/systemctl status danny-content-server
echo '---'
/bin/systemctl status danny-gas-app

echo -e '\n'
echo '****************************************'
echo '* Checking if backup disks are mounted *'
echo '****************************************'
if /usr/bin/mount | /usr/bin/grep /mnt/dannyshih_net_backup > /dev/null; then
    /usr/bin/mount | /usr/bin/grep /mnt/dannyshih_net_backup
else
    # Send an email right here and now if backup disks are ummounted.
    backupErrMsg='Backup disk(s) are not mounted! Backup operations will abort.'
    echo $backupErrMsg
    echo $backupErrMsg | /bin/mailx -s 'dannyshih.net - Backup disks not mounted' dss4f@dannyshih.net
fi

echo -e '\n'
echo '*********************************'
echo '* Check last timesync operation *'
echo '*********************************'
/bin/tail -n 6 /home/log/timesync.log

echo -e '\n'
echo '**********************************'
echo '* Check last certificate renewal *'
echo '**********************************'
/bin/tail -n 50 /home/log/renew-certs.log

echo -e '\n'
echo '*******************************'
echo '* Check last backup operation *'
echo '*******************************'
/bin/tail -n 100 /home/log/backup.log

exit 0
