#!/bin/sh

echo $1
echo -e "Unlocking...\c"
chmod -R u+w $1
echo "OK"

exit 0
