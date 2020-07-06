Run cron jobs as dss4f (sudo for other users) to get emails, since I do not receive emails as root. Swallowing stdout means an email is not sent unless there are errors (stderr is still passed to cron, which will email them).

| Schedule | User | Output | Description |
| -------- | ---- | -------| ----------- |
| Every 5 minutes | apache | stdout swallowed | Nextcloud background jobs |
| Every 10 minutes | root | stdout swallowed | Write a new quote to motd |
| Every 30 minutes | dss4f| stdout swallowed | Check status of primary raid |
| 2:37 AM daily | root | stdout swallowed | Renew letsencrypt certs. Logs to stderr if action taken |
| 3:00 AM daily | dss4f | all output emailed | Backup databases, gas to primary raid |
| 3:43 AM Tuesdays | root | all output emailed | Backup primary raid to NAS |
