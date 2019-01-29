#!/bin/bash

if [ -f /tmp/${USER}.tar ]; then
  mv /tmp/${USER}.tar /tmp/${USER}-old.tar
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
  ${USER} 

#cd /home/${USER}/BACKUPS
#target=`ls 2015* -td | head -1`
#echo " tar --append --file /tmp/${USER}.tar $target" > /tmp/XXXX
#tar --append --file /tmp/${USER}.tar $target
