#!/bin/sh

/bin/systemctl start danny-gas-app
/bin/systemctl start danny-content-server
/bin/systemctl start httpd
/bin/systemctl start postfix
/bin/systemctl start dovecot

exit 0
