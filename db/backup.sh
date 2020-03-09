#!/bin/bash
log=/var/log/dump_scrapper.log 
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin 
mysqldump -u ppri -p scrapper >scrapper-dump.sql
