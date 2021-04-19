# WATCH_AND_RUN
watch_dir_and_run () (
  # Watch a folder and when it changes run a command.
  FOLDER=$1
  COMMAND=$2

	trap exit_fxn SIGTERM SIGINT;
	exit_fxn() {
		echo "";
		echo "Finished Watching";
		exit 0
	}

  while [ true ]; do
    watch --color --chgexit --errexit -n 1 tree -Ds $1
    $2
		if [ $? -eq 0 ]
		then
			echo "'$2' Command Successful. Starting watch again in 3 seconds. Ctrl-C to exit"
      sleep 3s
		else
			read -n 1 -p "'$2' Command Failed. Press any key to continue watching again."
		fi
  done
)

alias war="watch_dir_and_run"
