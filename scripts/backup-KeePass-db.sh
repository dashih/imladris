#!/bin/sh

wget -O /home/dss4f/KeePass-Backup/tmp.kdbx "https://onedrive.live.com/download?cid=48AAA6D8292CB685&resid=48AAA6D8292CB685%21227&authkey=ANJRXUfPd9_qrks"
fileName="secrets.`date +"%m-%d-%y"`.kdbx"
mv /home/dss4f/KeePass-Backup/tmp.kdbx /home/dss4f/KeePass-Backup/$fileName
echo "Renamed backup to $fileName"

exit 0
