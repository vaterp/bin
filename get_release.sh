#! /bin/zsh


mkdir -p ~/work/$1/eserver  ~/work/$1/phoenix
cd ~/work/$1/eserver
cvs co -r $1 iDirect/hpb iDirect/shared
cd ~/work/$1/phoenix
cvs co -r $1 iDirect/hpb iDirect/shared
rs $1 p
tagme
rs $1
tagme





