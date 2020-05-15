#!/bin/sh

/bin/systemctl status danny-content-server
echo -e '\n--------------------\n'
/bin/systemctl status danny-gas-app

exit 0
