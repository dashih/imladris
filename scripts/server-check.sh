#!/bin/sh

echo '*********************'
echo '* Checking services *'
echo '*********************'
/bin/systemctl status danny-content-server
echo '---'
/bin/systemctl status danny-gas-app

echo -e '\n'
echo '*************************'
echo '* Checking backup array *'
echo '*************************'
# Send an email right here and now if degraded.
/bin/awk '/_U|U_/ {
    print "Backup array is degraded!";
    system("/bin/cat /proc/mdstat | /bin/mailx -s \"dannyshih.net - Backup array degraded!\" dss4f@dannyshih.net");
}' /proc/mdstat

/bin/cat /proc/mdstat
echo '---'
/sbin/mdadm --detail /dev/md127

echo -e '\n'
echo '****************************************'
echo '* Checking if backup disks are mounted *'
echo '****************************************'
if /usr/bin/mount | /usr/bin/grep /mnt/backup > /dev/null; then
    /usr/bin/mount | /usr/bin/grep /mnt/backup
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
