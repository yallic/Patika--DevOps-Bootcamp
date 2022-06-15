#!/bin/bash

source ./backup_script.conf
backup_date=$(date +"%d%m%Y_%H%M")

for user in "$BACKUP_DIRS"*
do

  backup_file=${user:6}_${backup_date}.tar.gz
  #echo $backup_file
  tar -czf $DEST_DIR/$backup_file --absolute-name $user
  md5sum $DEST_DIR/$backup_file > $DEST_DIR/$backup_file.md5.txt
  date +%T > /tmp/script.log
done

