export BAR_FUNC_PATH=/home/jm/.local/bin/bar-functions
mkdir /dev/shm/bar

update_smh(){
	#local -n functions_array=$1
	functions_array=( "$@" )
	for process in "${functions_array[@]}" 
	do
		"$BAR_FUNC_PATH/$process" &
	done
	wait
	refbar
}

update_smh $1
