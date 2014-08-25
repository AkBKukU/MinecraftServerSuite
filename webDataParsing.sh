
# getNewLink
# 
# Parses the Minecraft download page for the link for the newest version of Minecraft
function getNewLink ()
{	

	case $serverType in 

		'vanilla')
			# Link to Minecraft download page
			PAGE="https://minecraft.net/download"

			# Get page HTML as raw text
			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before and after the link
			before="https"
			after='.jar" class="download-link" data-dist="server"'

			# Find the points in the page HTML where the server download link is
			end=$(awk -v a="$RAW_PAGE" -v b="$after" 'BEGIN{print index(a,b)}')
			start=`expr $(awk -v a="${RAW_PAGE:$(expr $end - 120):120}" -v b="$before" 'BEGIN{print index(a,b)}') + $end - 121`

			# Return the download link as a string
			echo "${RAW_PAGE:$start:$(expr $end - $start)}jar"
			;;

		'cb-rb')
			# Link to Craftbukkit download page
			PAGE="https://dl.bukkit.org/downloads/craftbukkit/"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="chan-rb"
			after='.jar"'
			before='href="'

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$RAW_PAGE" -v b="$close" "BEGIN{print index(a,b)}" 2>/dev/null ) 
			area=${RAW_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}' 2>/dev/null ) + $astart + ${#before} - 1` 
			end=$(awk -v a="${RAW_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}" 2>/dev/null ) 

			# Return the version number as a string
			echo "https://dl.bukkit.org${RAW_PAGE:$start:$(expr $end - 1)}.jar"
			;;

		'cb-beta')
			# Link to Craftbukkit download page
			PAGE="https://dl.bukkit.org/downloads/craftbukkit/"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="chan-beta"
			after='.jar"'
			before='href="'

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$RAW_PAGE" -v b="$close" "BEGIN{print index(a,b)}" 2>/dev/null ) 
			area=${RAW_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}' 2>/dev/null ) + $astart + ${#before} - 1` 
			end=$(awk -v a="${RAW_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}" 2>/dev/null ) 

			# Return the version number as a string
			echo "https://dl.bukkit.org${RAW_PAGE:$start:$(expr $end - 1)}.jar"
			;;

		'cb-dev')
			# Link to Craftbukkit download page
			PAGE="https://dl.bukkit.org/downloads/craftbukkit/"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="chan-dev"
			after='.jar"'
			before='href="'

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$RAW_PAGE" -v b="$close" "BEGIN{print index(a,b)}" 2>/dev/null ) 
			area=${RAW_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}' 2>/dev/null ) + $astart + ${#before} - 1` 
			end=$(awk -v a="${RAW_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}" 2>/dev/null ) 

			# Return the version number as a string
			echo "https://dl.bukkit.org${RAW_PAGE:$start:$(expr $end - 1)}.jar"
			;;
	esac
}


# getNewestVersion
# 
# Parses the Minecraft wiki page to find the newest version number of Minecraft
function getNewestVersion ()
{

	case $serverType in 

		'vanilla')
			# Link to Minecraft wiki page
			PAGE="http://minecraft.gamepedia.com/Minecraft"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="<dt>Computer</dt>"
			after='</a>'
			before="\">"

			# Half the page because it is huge and the version number is located in the second half
			HALF_PAGE=${RAW_PAGE:0:$(expr ${#RAW_PAGE} / 2 ) }

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$HALF_PAGE" -v b="$close" "BEGIN{print index(a,b)}")
			area=${HALF_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}') + $astart + 1`
			end=$(awk -v a="${HALF_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}")

			# Return the version number as a string
			echo "${HALF_PAGE:$start:$(expr $end - 1)}"
			;;

		'cb-rb')
			# Link to Craftbukkit download page
			PAGE="https://dl.bukkit.org/downloads/craftbukkit/"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="chan-rb"
			after='">'
			before='version '

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$RAW_PAGE" -v b="$close" "BEGIN{print index(a,b)}" 2>/dev/null ) 
			area=${RAW_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}' 2>/dev/null ) + $astart + ${#before} - 1` 
			end=$(awk -v a="${RAW_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}" 2>/dev/null ) 

			# Return the version number as a string
			echo "${RAW_PAGE:$start:$(expr $end - 1)}"
			;;

		'cb-beta')
			# Link to Craftbukkit download page
			PAGE="https://dl.bukkit.org/downloads/craftbukkit/"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="chan-beta"
			after='">'
			before='version '

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$RAW_PAGE" -v b="$close" "BEGIN{print index(a,b)}" 2>/dev/null ) 
			area=${RAW_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}' 2>/dev/null ) + $astart + ${#before} - 1` 
			end=$(awk -v a="${RAW_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}" 2>/dev/null ) 

			# Return the version number as a string
			echo "${RAW_PAGE:$start:$(expr $end - 1)}"
			;;

		'cb-dev')
			# Link to Craftbukkit download page
			PAGE="https://dl.bukkit.org/downloads/craftbukkit/"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			close="chan-dev"
			after='">'
			before='version '

			# Get the area of the part that is close starts because there are few unique ids on the page
			astart=$(awk -v a="$RAW_PAGE" -v b="$close" "BEGIN{print index(a,b)}" 2>/dev/null ) 
			area=${RAW_PAGE:$astart}

			# Find the points in the page HTML where the info is
			start=`expr $(awk -v a="$area" -v b="$before" 'BEGIN{print index(a,b)}' 2>/dev/null ) + $astart + ${#before} - 1` 
			end=$(awk -v a="${RAW_PAGE:$start}" -v b="$after" "BEGIN{print index(a,b)}" 2>/dev/null ) 

			# Return the version number as a string
			echo "${RAW_PAGE:$start:$(expr $end - 1)}"
			;;
	esac

}
