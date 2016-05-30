#!/bin/sh

if [ "$1" = '' ]
then
    echo 'Gotta supply an argument.'
    exit 0
fi

if [ "$1" != '--test' ]
then
    echo '--------------------------------------------------------------------------------' &> "$1/backup.log"
    date >> "$1/backup.log"
    echo '--------------------------------------------------------------------------------' >> "$1/backup.log"
fi

backupDirs=(
    '/home/www'
    '/home/basement/music'
    '/home/basement/pictures'
    '/home/basement/software'
    '/home/dss4f'
)

size=0
for dir in "${backupDirs[@]}"
do
    dirSize=$(($(du -sb $dir | cut -f1)))
    if [ "$1" = '--test' ]
    then
        echo $dir":" $(numfmt --to=si $dirSize)
    else
        rsync -a $dir $1
        echo $dir":" $(numfmt --to=si $dirSize) >> "$1/backup.log"
    fi
    
    size=$(($size+$dirSize))
done

if [ "$1" = '--test' ]
then
    echo -e "\nTOTAL:" $(numfmt --to=si $size)
else
    echo -e "\nTOTAL:" $(numfmt --to=si $size) >> "$1/backup.log"
    echo "Log written to $1/backup.log"
fi

exit 0
