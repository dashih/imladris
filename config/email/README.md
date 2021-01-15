Port 25 - Unencrypted SMTP. This can be used locally by say danny-backup-monitor to easily send email alerts without authentication. But this should not be let through the firewall.

Port 587 - Postfix's "submission" port. This is unencrypted + STARTTLS.

Port 465 - Postfix's SMTPS port. No clients really use this, as everyone just uses STARTTLS. But no harm letting it through the firewall.

Port 143 - IMAP unencrypted + STARTTLS.

Port 993 - IMAPS. Same as Port 465; no clients seem to ever start off with IMAPS, preferring to just use STARTTLS.

Note: Use `.forward` files to forward root and user mail to a less-privileged alerts user.
