## Cockpit
yum install cockpit
cockpit.conf -> /etc/cockpit/
cockpit.service -> /usr/lib/systemd/system

### Authentication
The above forces cockpit to use ssh auth. Create a 'cockpit' user using adduser, and let it through sshd via password authentication.

### TODO
If cockpit one day supports ssh key authentication, use it instead of password.
