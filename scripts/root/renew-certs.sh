#!/bin/sh

echo '----------------------------'
/bin/date
echo '----------------------------'

/bin/certbot renew --pre-hook "/usr/local/bin/stop-services.sh" --post-hook "/usr/local/bin/start-services.sh"

exit 0
