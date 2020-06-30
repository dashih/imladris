#!/bin/sh

mdadm --detail --test /dev/md/dannyshihnet

# 0 - The array is functioning normally.
# 1 - The array has at least one failed device.
# 2 - The array has multiple failed devices such that it is unusable.
# 4 - There was an error while trying to get information about the device.
if [ $? -ne 0 ]
then
    # Print to stderr so cron will email.
    mdadm --detail --test /dev/md/dannyshihnet 1>&2
    echo "-----------------------------------------------------------------------" 1>&2
    cat /proc/mdstat 1>&2
fi

exit 0
