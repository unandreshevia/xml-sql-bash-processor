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
				mv $FILENAME ../$outputfolder
#####################################################################
# INSERT IN THIS SECTION THE INVOCATION TO THE SQL SCRIPT
mysql --protocol=TCP --user=USERNAME_GOES_HERE --password=PASSWORD_GOES_HERE --host=0.0.0.0 -e "set @filename=\"$FILENAME\";set @procfolder=\"$procfolder\";" <<QUERY_INPUT
LOAD XML LOCAL INFILE '../@procfolder/@filename'
INTO TABLE landing.test
ROWS IDENTIFIED BY '<Item>'
(
@docid,
@ReferenceNumber,
@Created,
@activationdate,
@expirationdate,
@flag,
@username,
@Title,
@RFPCategory,
@commodity,
@type,
@RFPDescription,
@ZipCode,
@City,
@State,
@sourceurl,
@orgname,
@datekey,
@ItemID,
@ItemSourceName
)
SET
docid=@docid,
ReferenceNumber=@ReferenceNumber,
Created=@Created,
activation_date=@activationdate,
expiration_date=@expirationdate,
flag=@flag,
username=@username,
Title=@Title,
RFPCategory=@RFPCategory,
commodity=@commodity,
type=@type,
RFPDescription=@RFPDescription,
ZipCode=@ZipCode,
City=@City,
State=@State,
sourceurl=@sourceurl,
orgname=@orgname,
datekey=@datekey,
ItemID=@ItemID,
ItemSourceName=@ItemSourceName,
system_file_name=@filename,
QUERY_INPUT
#####################################################################
				echo "$FILENAME loaded successfully."
			fi
		done
		echo "File processing complete."
		echo "Exiting program..."
	else
		echo "No files found in $initfolder to be processed."
		echo "Exiting program..."
fi
