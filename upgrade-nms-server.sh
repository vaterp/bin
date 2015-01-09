nmsversion="IDS-15.0.1.0"
thefile="IDS-developer-15.0.1.0-132.iso"
#thefile="IDS-15.0.1.0-132.iso"

cd /tmp
wget http://releases.eng.idirect.net//${nmsversion}-latest/ISO/${thefile}

mkdir -p /media/cdrom
mount -o loop ${thefile}  /media/cdrom
/media/cdrom/iDirect/install/idsUpdate --noVerify --reboot
umount /media/cdrom
chkconfig idirect_nms on
echo "Make sure you have right lic file in /home/nms/cfg"
