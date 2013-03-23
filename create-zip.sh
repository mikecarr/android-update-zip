#!/bin/sh

FILE_NAME=android-update
ZIP_NAME=$FILE_NAME.zip
BACKUP_FOLDER=backup/

if [ -f $ZIP_NAME ];
then
   echo "File $ZIP_NAME exists, moving to backup folder."
   if [ ! -d $BACKUP_FOLDER ];
   then
     mkdir $BACKUP_FOLDER
   fi
   NOW=$(date +"%m-%d-%Y")-$(date +"%T")
   mv $ZIP_NAME $BACKUP_FOLDER/$FILE_NAME-$NOW.zip
fi

find . -name ".DS_Store" -exec rm -rf {} \;
zip -r $ZIP_NAME data META-INF
