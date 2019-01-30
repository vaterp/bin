#!/bin/bash

if [ -f /tmp/${USER}.tar ]; then
  mv /tmp/${USER}.tar /tmp/${USER}-old.tar
  echo "----Files changed since last backup"
  find ~ -newer /tmp/${USER}-old.tar | grep -v \/home\/${USER}\/.cache
  echo "----Done List"
fi

cd /home
tar cf /tmp/${USER}.tar --exclude ${USER}/.cache --exclude ${USER}/wsvr \
  --exclude ${USER}/.sudo_as_admin_successful \
  --exclude ${USER}/.swp \
  --exclude ${USER}/.Xauthority \
  --exclude ${USER}/.ICEauthority \
  --exclude ${USER}/.xsession-errors \
  --exclude ${USER}/.xsession-errors.old \
  --exclude ${USER}/.gnuplot-wxt --exclude ${USER}/.gnuplot_history \
  ${USER}  2>/dev/null

#cd /home/${USER}/BACKUPS
#target=`ls 2015* -td | head -1`
#echo " tar --append --file /tmp/${USER}.tar $target" > /tmp/XXXX
#tar --append --file /tmp/${USER}.tar $target
