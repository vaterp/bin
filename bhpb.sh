#!/bin/zsh
cd $h
 echo -n "Current date is: " 
 date
echo "Building samnc"
cd samnc && make > /dev/null
echo "Building sarouter"
cd ../sarouter && make > /dev/null
echo "Building sana"
cd ../sana && make > /dev/null
echo "Building sada"
cd ../sada && make > /dev/null
echo "Building sarmt"
cd ../sarmt && make > /dev/null
echo "Building iCon"
cd ../consolidator && make > /dev/null
echo "Building iac"
cd ../iac && make > /dev/null

cd ..
echo "\n\n\n\nNew Binaries:"
 find . -type f -name sada  -ls | cut -d' ' -f3,11-
 find . -type f -name sana  -ls | cut -d' ' -f3,11-
 find . -type f -name sarouter  -ls | cut -d' ' -f3,11-
 find . -type f -name sarmt  -ls | cut -d' ' -f3,11-
 find . -type f -name iCon  -ls | cut -d' ' -f3,11-
 find . -type f -name iac  -ls | cut -d' ' -f3,11-
echo -n "Current date is: " 
date
