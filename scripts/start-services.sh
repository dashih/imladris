#!/bin/sh

/bin/systemctl start danny-gas-app
/bin/systemctl start httpd
/bin/systemctl start postfix
/bin/systemctl start dovecot

exit 0
