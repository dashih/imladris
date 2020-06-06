Run cron jobs as dss4f (sudo for other users) to get emails, since I do not receive emails as root.

| Schedule | User | Output | Description |
| -------- | ---- | -------| ----------- |
| Every 5 minutes | apache | stdout swallowed | Nextcloud background jobs |
| Every 10 minutes | root | stdout swallowed | Write a new quote to motd |
| Every 30 minutes | dss4f | stdout swallowed. Emails if array is degraded. | Check NAS RAID |
| 2:37 AM daily | root | all output emailed | Renew letsencrypt certs |
| 3:00 AM daily | dss4f | all output emailed | Backup databases, gas to NAS |
