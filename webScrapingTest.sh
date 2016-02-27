#!/bin/bash

# webDataParsing
#  Reads web pages to get cersion numbers and download links
if [ -f './webDataParsing.sh' ]
	then
	source ./webDataParsing.sh
fi

serverType="vanilla"
echo "$(getNewestVersion): $(getNewLink)"

