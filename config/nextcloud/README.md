# Nextcloud
Nextcloud is amazing open source software, but it can be a PITA to configure.

## Redis
Use redis for transactional file locking. It's also convenient just to use it for local memory caching, even if APCu is faster.

If you run into locking issues, put Nextcloud in maintenance mode. Then clear out redis:
```
redis-cli flushall
```

## Regarding large uploads
Make sure to set all settings in php.ini and nextcloud.conf. Every single one matters!

### Web client
Uploading via the web client has gotten pretty robust, as long as apache and php have been configured well. The upload is chunked into manageable sizes.

### Desktop/mobile clients
These work reasonably well. Very large files or a great many files can be a problem, though redis-powered file locking helps.

### WebDav
Nextcloud supports mounting WebDav, which should remove the need for a writeable samba.

#### From MacOSX
MacOSX Finder sucks!!!  The DS_STORE files give Nextcloud WebDav tons of issues.

#### Rsync
Works well, but use --inplace. Otherwise, if the file is too big, Nextcloud will end up locking the temporary file, preventing the final rename operation from succeeding.

#### Samba
If all else fails, get the file on to the server using samba. Then run:

```
sudo -u apache php /var/www/html/nextcloud/occ files:scan --path=dss4f/files/WHATEVER dss4f
```
