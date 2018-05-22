#!/bin/sh

THESITE="smarterware.org"
THEDB="my_database_name"
THEDBUSER="my_database_user"
THEDBPW="my_database_password"
THEDATE=`date +%d%m%y%H%M`

mysqldump -u $THEDBUSER -p${THEDBPW} $THEDB | gzip > /var/www/vhosts/$THESITE/backups/files/dbbackup_${THEDB}_${THEDATE}.bak.gz

tar czf /var/www/vhosts/$THESITE/backups/files/sitebackup_${THESITE}_${THEDATE}.tar -C / var/www/vhosts/$THESITE/httpdocs
gzip /var/www/vhosts/$THESITE/backups/files/sitebackup_${THESITE}_${THEDATE}.tar

find /var/www/vhosts/$THESITE/backups/files/site* -mtime +5 -exec rm {} \;
find /var/www/vhosts/$THESITE/backups/files/db* -mtime +5 -exec rm {} \;
