for i in $(find . -maxdepth 1 -mindepth 1 -type d)
do
	cd $i
	git rev-parse --git-dir > /dev/null
	if (($? -eq 0)); then
		echo -e "\033[1;34mUpdating $i \033[0m"
		#git pull | grep -v "Already up-to-date."
		git b
	else
		echo -e "\034[1;34mNOT A GIT REPO $i \033[0m"
	fi
	cd ..
done
