unsetopt autopushd
pushd $h
cd samnc && make
cd ../sarouter && make
cd ../sana && make
cd ../sada && make
cd ../sarmt && make
cd ..
 find . -type f -name sada  -ls | cut -d' ' -f3,11-
 find . -type f -name sana  -ls | cut -d' ' -f3,11-
 find . -type f -name sarouter  -ls | cut -d' ' -f3,11-
 find . -type f -name sarmt  -ls | cut -d' ' -f3,11-
popd
setopt autopushd
