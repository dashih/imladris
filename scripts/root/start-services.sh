#!/bin/sh

echo "Setting permissions on /etc/letsencrypt..."
/usr/bin/chgrp -R ssl /etc/letsencrypt
/usr/bin/chmod -R g+rX /etc/letsencrypt

echo "Starting services..."
/bin/systemctl start danny-gas-app
/bin/systemctl start danny-quotes
/bin/systemctl start httpd
/bin/systemctl start postfix
/bin/systemctl start dovecot
echo "Done."

exit 0
