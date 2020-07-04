#!/bin/sh

# Set permissions so dss4f can access the new cert.
/usr/bin/chgrp -R ssl /etc/letsencrypt
/usr/bin/chmod -R g+rX /etc/letsencrypt

/bin/systemctl start danny-gas-app
/bin/systemctl start danny-quotes
/bin/systemctl start httpd
/bin/systemctl start postfix
/bin/systemctl start dovecot

exit 0
