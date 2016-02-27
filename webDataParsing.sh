
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

			#CraftBukkit support removed until the legal dispute has been resolved
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
			PAGE="https://minecraft.net/download"

			# Get page HTML as raw text

			RAW_PAGE=$(wget "$PAGE" -q -O -)

			# Set text that comes before, after, and is near the info
			before="Minecraft.Download/versions/"
			after='/minecraft_server.'

			# Find the points in the page HTML where the server download link is
			end=$(awk -v a="$RAW_PAGE" -v b="$after" 'BEGIN{print index(a,b)}')
			start=`expr $(awk -v a="${RAW_PAGE:$(expr $end - 120):120}" -v b="$before" 'BEGIN{print index(a,b)}') + $end - 121`

			# Return the download link as a string
			echo "${RAW_PAGE:$(expr $start + ${#before}):$(expr $end - $start - 1 - ${#before})}"
			;;

	esac

}
