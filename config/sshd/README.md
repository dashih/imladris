## sshd
Turn off password authentication except for 'cockpit' user. This may go eventually, if Cockpit starts supporting ssh key authentication for the primary server.

### Generating keys
`ssh-keygen -t ed25519`

### Key auth
Add .pub keys to
`.ssh/authorized_keys` (700 permissions)
