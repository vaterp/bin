#!/bin/sh

#Upstream swith
gnome-terminal --title "Upstream Switch" --command "telnet lant 10012"&
#Upstream router
gnome-terminal --title "Upstream Router" --command "telnet lant 10029"&
#Tunnel switch
gnome-terminal --title "Tunnel Switch" --command "telnet lant 10011"&
#Remote 1 switch
gnome-terminal --title "Rem1Switch" --command "telnet lant 10013"&

