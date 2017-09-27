#!/bin/bash
# Script for Mr. Optimal
# Author: Heviacorp
# What it does: loop, move and save files

# Folder from where the files will be copied
initfolder=01_inbound

# Folder to where the files will be temporary copied and examined
procfolder=02_processing

# Folder to where the files will be copied if not repeated
outputfolder=03_extracted

# Folder to where the files will be copied if they already exist in the outputfolder
badfolder=04_bad

# Variables to define the type of file to be transferred
REGEX_DATE='[0-9]{4}[-/][0-9]{2}[-/][0-9]{2}'
PREFIX='ABD\_'
FILE_EXT='\.xml'

# Variable that contains the prepared statement for the find function

PREP_ARG="^.*${PREFIX}${REGEX_DATE}${FILE_EXT}"
#####################################################################
# Beginning of the work
echo "Starting"
echo "Checking XML files..."
echo "..."
cd $initfolder
if find . -regextype posix-extended -regex $PREP_ARG | read
	then
		for FILENAME in *.xml; do
			if [[ $FILENAME =~ $PREP_ARG ]];
				then
					mv -f $FILENAME ../$procfolder
			fi
		done
		cd ..
		cd $procfolder
		for FILENAME in *.xml; do
			if [ -e ../$outputfolder/$FILENAME ];
			then
				echo "Error, $FILENAME already exists."
				mv -f $FILENAME ../$badfolder
				echo "Moved to $badfolder"
			else
				echo "Transfering $FILENAME..."
				sh ../sql_launcher.sh $FILENAME
				mv $FILENAME ../$outputfolder
				echo "$FILENAME loaded successfully."
			fi
		done
		echo "File processing complete."
		echo "Exiting program..."
	else
		echo "No files found in $initfolder to be processed."
		echo "Exiting program..."
fi
