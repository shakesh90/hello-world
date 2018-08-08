###This is script created by Shakesh#####
#!/bin/sh
DIR="/tmp/Backup"
# Check existence of backup folder, otherwise, create it
if [ ! -d "$DIR" ]
then
  mkdir "$DIR"
  chown -R zimbra:zimbra "$DIR"
fi
echo Backing up LDAP DB...
su - zimbra -c "/opt/zimbra/libexec/zmslapcat $DIR"
if [ $? -eq 0 ]
then
  echo "Succeeded!"
else
  echo "Backup fialed!"
fi
echo Backing up LDAP Config...
su - zimbra -c "/opt/zimbra/libexec/zmslapcat -c $DIR"
if [ $? -eq 0 ]
then
  echo "Succeeded!"
else
  echo "Backup Failed!"
fi

