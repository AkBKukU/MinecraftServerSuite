# includeScript
# 
# Embeds the specified script where the given comment is first located
function includeScript ()
{
	includeScript="$1"
	includeLocation="$2"
	mainScript="$3"
	mainCode=$(cat $mainScript)
	includeCode=$(cat $includeScript)

	# Find include location
	includePoint=$(awk -v a="$mainCode" -v b="$includeLocation" 'BEGIN{print index(a,b)}')  &>> /dev/null
	afterInclude=$(expr $includePoint + ${#includeLocation} + 1)

	before=${mainCode:0:$includePoint}

	after=${mainCode:afterInclude}

	builtCode="$before$includeCode$after"
	
	echo "$builtCode" > $mainScript
}

function includeExample ()
{

	# Include basicFunctions library during development
	#    It's kept seperate to make files easier to read
	if [ -f './basicFunctions.sh' ]
		then

		source ./basicFunctions.sh
	fi

	# Insert basicFunctions library during install
	#[INSERT_FUNCTIONS_HERE]

	includeScript "./basicFunctions.sh" "#[INSERT_FUNCTIONS_HERE]" > "$mcDir/mcmanager"
}


# getYesNo
# Asks the user the given question and returns a 1 for yes and a 0 for no
function getYesNo ()
{	
	output=2
	message=$1
	valid=false
	until [ $valid == true ]
	do
	
	echo -n "$message (y/n): "
	read choice
	choice=$(echo "${choice^^}" )
		case $choice in
			"Y"|"YES")
				output=1
				valid=true
				;;

			"N"|"NO")
				output=0
				valid=true
				;;
		esac
	done

	return $output
}


# rootTest
# Tests if the script was run qith root permissions and tells the user they need to if they didn't.
function rootTest ()
{
	if [[ $EUID -ne 0 ]] 
	then
   		echo "You need to run this as root to be able to make system changes"
		echo -e "Run \"sudo $0\" next time"
		exit 1
	fi
}

# commandInfo
# Says message given the runs command. Once complete adds result to message line.
function commandInfo ()
{
	output=2
	RED=$(tput setaf 1)
	GREEN=$(tput setaf 2)
	NORMAL=$(tput sgr0)
	PURPLE=$(tput setaf 5)

	message=$1
	commands=$2
	echo -n "$message"

    let COL=$(expr $(tput cols) - ${#message})
	`$commands` &>> /dev/null
	tempResult=$?
	if [ $tempResult == 0 ]
	then
	    printf "%s%${COL}s" "" "[$GREEN OK  $NORMAL]"
	    echo
		output=0

	elif [ $tempResult == 1 ]
	then
	    printf "%s%${COL}s" "" "[$RED FAIL $NORMAL]"
	    echo
		output=1

	else
	    printf "%s%${COL}s" "" "[$PURPLE ???? $NORMAL]"
	    echo
		output=2


	fi

	return $output
}
