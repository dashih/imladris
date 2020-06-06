Run cron jobs as dss4f (sudo for other users) to get emails, since I do not receive emails as root.

| Schedule | User | Description |
| -------- | ---- | ----------- |
| Every 5 minutes | apache | Nextcloud background jobs |
| Every 10 minutes | root | Write a new quote to motd |
| Every 30 minutes | dss4f | Check NAS RAID. stdout swallowed. Script will output on error and will send an email if array is degraded. |
| 2:37 AM daily | root | Renew letsencrypt certs |
| 3:00 AM daily | dss4f | Backup databases, gas to NAS |
