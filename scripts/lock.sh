#!/bin/sh

echo $1
echo -e "Locking...\c"
chmod -R a-w $1
echo "OK"

exit 0
