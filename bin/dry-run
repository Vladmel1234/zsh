#!/bin/sh

# http://www.findnwrite.com/musings/dry-run-in-shell-scripts/
# http://www.unix.com/shell-programming-scripting/137309-preview-what-would-execute-my-shell-script.html

# dry is a variable that indicates whether we want to do dry run or not
# Currently dry run is enabled. To disable it, set the dry variable to any other string
# Note: define the dry variable above the execute function below so
# that its available in the execute function
dry="y"

# Function: execute
function execute(){
  # Irrespective of whether dry run is enabled or not, we display
  # the command on the screen
	echo "COMMAND: ${@}"

  # if dry run is enabled then simply return
	if [ $dry == "y" ]; then
		return 0
	fi

  # if dry run is disabled, then execute the command
	eval "$@"
}

# Now just append execute to all your commands
# This will cause them to print irrespective of whether we are doing any dry run or not
# Commands are only executed if dry run is disabled