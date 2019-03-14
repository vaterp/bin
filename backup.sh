#!/bin/bash

if [ -z "${USER}" ]; then
  echo "No USER variable set"
  exit 1
fi

if [ ! -d "/home/${USER}" ]; then
  echo "No ${USER} directory to backup"
  exit 1
fi

BACKUPFILE=${USER}-${HOSTNAME}

#Copy some system config files I like to keep
#cp /etc/rc.local ~/backups
#cp /etc/hosts ~/backups
#Get crontab backup
#Get firefox bookmark backup
#Get sudoers backup

if [ -f /tmp/${BACKUPFILE}.tar ]; then
  mv /tmp/${BACKUPFILE}.tar /tmp/${BACKUPFILE}-old.tar
  echo "----Files changed since last backup"
  find ~ -newer /tmp/${BACKUPFILE}-old.tar | grep -v \/home\/${USER}\/.cache
  echo "----Done List"
fi

cd /home
tar cf /tmp/${BACKUPFILE}.tar --exclude ${USER}/.cache --exclude ${USER}/wsvr \
  --exclude ${USER}/.gnupg \
  --exclude ${USER}/.config/ibus \
  --exclude ${USER}/.config/pulse \
  --exclude ${USER}/.sudo_as_admin_successful \
  --exclude ${USER}/.swp \
  --exclude ${USER}/.Xauthority \
  --exclude ${USER}/.ICEauthority \
  --exclude ${USER}/.xsession-errors \
  --exclude ${USER}/.xsession-errors.old \
  --exclude ${USER}/.gnuplot-wxt --exclude ${USER}/.gnuplot_history \
  ${USER}  2>/dev/null

#Set in crontab
if [ -v ENCRYPT ]; then
  echo "Encrypting....."
  cd /tmp
  rm ${BACKUPFILE}.tar.gpg 2>/dev/null
  gpg --symmetric --cipher-algo AES256 ${BACKUPFILE}.tar
fi

#Now I have oneweb.tar.gpg encrypted and uploadable to dropbox iff desired.


#cd /home/${USER}/BACKUPS
#target=`ls 2015* -td | head -1`
#echo " tar --append --file /tmp/${USER}.tar $target" > /tmp/XXXX
#tar --append --file /tmp/${USER}.tar $target
