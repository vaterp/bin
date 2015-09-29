#!/bin/bash
cd /home
tar cf /tmp/bsnyder.tar --exclude bsnyder/BACKUPS --exclude bsnyder/.mozilla --exclude bsnyder/.cache --exclude bsnyder/.config --exclude bsnyder/SBC bsnyder 

cd /home/bsnyder/BACKUPS

target=`ls 2015* -td | head -1`

echo " tar --append --file /tmp/bsnyder.tar $target" > /tmp/XXXX

tar --append --file /tmp/bsnyder.tar $target

