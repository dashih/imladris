#!/bin/sh

echo "Stopping services for SSL cert renewal..." 1>&2
/bin/systemctl stop danny-gas-app
/bin/systemctl stop danny-quotes
/bin/systemctl stop httpd
/bin/systemctl stop dovecot
/bin/systemctl stop postfix
echo "Yielding to certbot for cert renewal..." 1>&2

exit 0
