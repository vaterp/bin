for i in $(find . -maxdepth 1 -type d)
do
	if [ "$i" == "." ] 
	then
		continue
	fi
	
	echo -e "\033[1;34mUpdating $i \033[0m"

	cd $i
	git pull | grep -v "Already up-to-date."
	git b
	cd ..
done
