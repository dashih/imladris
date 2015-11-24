#!/bin/sh

echo 'Sync system time with nist.gov...'
/usr/sbin/ntpdate time.nist.gov

echo 'Sync hardware clock with system time...'
/sbin/hwclock --systohc
/sbin/hwclock --show

echo '--------';

exit 0
