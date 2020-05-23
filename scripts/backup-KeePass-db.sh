#!/bin/sh

# Backup directory
KeePassDir="/home/dss4f/KeePass-Backup"

# Download link (stored externally)
downloadLink="`cat $KeePassDir/DOWNLOAD`"

# LATEST indicates the most recent backup file
latestMarkerFile="$KeePassDir/LATEST"
latestBackupFileName="`cat $KeePassDir/LATEST`"
latestBackup="$KeePassDir/$latestBackupFileName"

# tmp file
newFileName="`openssl rand -hex 16`.kdbx"
newFile="$KeePassDir/$newFileName"

# Download
wget -O $newFile $downloadLink

# Check the hash of the downloaded file vs the most recent.
latestHash=`sha256sum $latestBackup | awk '{print $1}'`
tmpHash=`sha256sum $newFile | awk '{print $1}'`

if [ "$tmpHash" == "$latestHash" ]
then
    # If the hashes match, the new file is the same, so discard it.
    rm $newFile
else
    # If hashes differ, keep the new file and update the latest backup.
    echo $newFileName &> $latestMarkerFile

    # Send an email.
    echo $newFileName | mailx -s "New KeePass backup" dss4f@dannyshih.net
fi

exit 0
