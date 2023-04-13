
cd ~ || exit

notatki_folder_is_missing=1

if [ "$(ls -A .)" ]
then
	for dir in ./*/
	do
		dir=${dir%*/}
		subdirectory=${dir##*/}
		if [ "$subdirectory" = "Notatki" ]
		then
			notatki_folder_is_missing=0
		fi
	done
fi

if [ $notatki_folder_is_missing -eq 1 ]
then
	mkdir "Notatki"
fi

cd ~/Notatki || exit

current_date=$(date +"%Y_%m_%b_%d_%A_%H_%M_%S") 
current_year=$(date +"%Y")
current_month=$(date +"%m_%b")
# current_day=$(date +"%d")
current_year_is_missing=1
directory_year=$current_year

if [ "$(ls -A .)" ]
then
	for dir in ./*/
	do
		dir=${dir%*/}
		directory_year=${dir##*/}
		if [ "$directory_year" = "$current_year" ]
		then
			current_year_is_missing=0
		fi
	done
fi

if [ $current_year_is_missing -eq 1 ]
then
	mkdir "$current_year"
fi

cd "$current_year" || exit

current_month_is_missing=1
directory_month=$current_month

if [ "$(ls -A .)" ]
then
	for dir in ./*/
	do
		dir=${dir%*/}
		directory_month=${dir##*/}
		if [ "$directory_month" = "$current_month" ]
		then
			current_month_is_missing=0
		fi
	done
fi

if [ $current_month_is_missing -eq 1 ]
then
	mkdir "$current_month"
	mkdir "${current_month}/.log"
fi

cd "$current_month" || exit

touch .log/"${current_date}_log" 

if [ "$1" = "hx" ] || [ "$1" = "nano" ] || [ "$1" = "vim" ] || [ "$1" = "vi" ]
then
	${1} "${current_date}_${2}"
else
	${1:-gedit --new-window} "${current_date}_${2}" > .log/"${current_date}_log" &

#${1:-gedit} "${current_date}_${2}" > /dev/null 2>&1 &

#${1:-gedit} "${current_date}_${2}" 2> /dev/null 

fi
