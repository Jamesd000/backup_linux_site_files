#!/bin/sh

THESITE="smarterware.org"
THEDATE=`date +%d%m%y%H%M`



tar czf /var/www/vhosts/$THESITE/backups/files/sitebackup_${THESITE}_${THEDATE}.tar -C / var/www/vhosts/$THESITE/httpdocs
gzip /var/www/vhosts/$THESITE/backups/files/sitebackup_${THESITE}_${THEDATE}.tar

find /var/www/vhosts/$THESITE/backups/files/site* -mtime +5 -exec rm {} \;

