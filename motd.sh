function convertMOTDtoFile ()
{
	output="$1"
	
	# Color Codes
	output="$(echo "$output" | sed 's/\[Black\]/\\\\u00A70/g')"
	output="$(echo "$output" | sed 's/\[Dark\sBlue\]/\\\\u00A71/g')"
	output="$(echo "$output" | sed 's/\[Dark\sGreen\]/\\\\u00A72/g')"
	output="$(echo "$output" | sed 's/\[Dark\sAqua\]/\\\\u00A73/g')"
	output="$(echo "$output" | sed 's/\[Dark\sRed\]/\\\\u00A74/g')"
	output="$(echo "$output" | sed 's/\[Dark\sPurple\]/\\\\u00A75/g')"
	output="$(echo "$output" | sed 's/\[Gold\]/\\\\u00A76/g')"
	output="$(echo "$output" | sed 's/\[Gray\]/\\\\u00A77/g')"
	output="$(echo "$output" | sed 's/\[Dark\sGray\]/\\\\u00A78/g')"
	output="$(echo "$output" | sed 's/\[Blue\]/\\\\u00A79/g')"
	output="$(echo "$output" | sed 's/\[Green\]/\\\\u00A7a/g')"
	output="$(echo "$output" | sed 's/\[Aqua\]/\\\\u00A7b/g')"
	output="$(echo "$output" | sed 's/\[Red\]/\\\\u00A7c/g')"
	output="$(echo "$output" | sed 's/\[Light\sPurple\]/\\\\u00A7d/g')"
	output="$(echo "$output" | sed 's/\[Yellow\]/\\\\u00A7e/g')"
	output="$(echo "$output" | sed 's/\[White\]/\\\\u00A7f/g')"

	# Style Codes
	output="$(echo "$output" | sed 's/\[Obfuscated\]/\\\\u00A7k/g')"
	output="$(echo "$output" | sed 's/\[Bold\]/\\\\u00A7l/g')"
	output="$(echo "$output" | sed 's/\[Strikethrough\]/\\\\u00A7m/g')"
	output="$(echo "$output" | sed 's/\[Underline\]/\\\\u00A7n/g')"
	output="$(echo "$output" | sed 's/\[Italic\]/\\\\u00A7o/g')"
	output="$(echo "$output" | sed 's/\[Reset\]/\\\\u00A7r/g')"

	echo $output
}

function convertMOTDfromFile ()
{
	output="$1"
	
	# Color Codes
	output="$(echo "$output" | sed 's/\\u00A70/\[Black\]/g')"
	output="$(echo "$output" | sed 's/\\u00A71/\[Dark Blue\]/g')"
	output="$(echo "$output" | sed 's/\\u00A72/\[Dark Green\]/g')"
	output="$(echo "$output" | sed 's/\\u00A73/\[Dark Aqua\]/g')"
	output="$(echo "$output" | sed 's/\\u00A74/\[Dark Red\]/g')"
	output="$(echo "$output" | sed 's/\\u00A75/\[Dark Purple\]/g')"
	output="$(echo "$output" | sed 's/\\u00A76/\[Gold\]/g')"
	output="$(echo "$output" | sed 's/\\u00A77/\[Gray\]/g')"
	output="$(echo "$output" | sed 's/\\u00A78/\[Dark Gray\]/g')"
	output="$(echo "$output" | sed 's/\\u00A79/\[Blue\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7a/\[Green\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7b/\[Aqua\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7c/\[Red\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7d/\[Light Purple\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7e/\[Yellow\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7f/\[White\]/g')"

	# Style Codes
	output="$(echo "$output" | sed 's/\\u00A7k/\[Obfuscated\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7l/\[Bold\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7m/\[Strikethrough\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7n/\[Underline\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7o/\[Italic\]/g')"
	output="$(echo "$output" | sed 's/\\u00A7r/\[Reset\]/g')"

	echo $output
}