#!/bin/sh

/bin/systemctl stop danny-gas-app
/bin/systemctl stop danny-quotes
/bin/systemctl stop httpd
/bin/systemctl stop dovecot
/bin/systemctl stop postfix

exit 0
