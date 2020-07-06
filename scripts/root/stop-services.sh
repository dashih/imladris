#!/bin/sh

echo "Stopping services for SSL cert renewal..."
/bin/systemctl stop danny-gas-app
/bin/systemctl stop danny-quotes
/bin/systemctl stop httpd
/bin/systemctl stop dovecot
/bin/systemctl stop postfix
echo "Yielding to certbot for cert renewal..."

exit 0
