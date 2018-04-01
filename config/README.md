## cron and email elerts
Every hour - General server check logs to server-check.log. This sends emails on errors:
- Backup array is degraded
- Backup disks are not mounted

2:17 AM every day - Sync local time with time.nist.gov

2:37 AM Thursdays - Renew SSL certificates with certbot/LetsEncrypt. Sends an email.

3:00 AM every day - Backup /home

8:30 AM Sundays and Thursdays - Bi-weekly email. This is the same as the hourly check, but it sends an email.
