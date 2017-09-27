#!/bin/bash
echo 'Initiating SQL'
echo "..."
echo "..."
cp $1 temp.xml
echo "Loading XML contents into tables in MySql"
# SQL COMMANDS SECTION
mysql --protocol=TCP --user=YOUR_USERNAME--password=YOUR_PASSWORD --host=127.0.0.1 << EOF
LOAD XML LOCAL INFILE 'temp.xml'
INTO TABLE landing.test
ROWS IDENTIFIED BY '<Item>'
(
@docid,
@Created,
@activationdate,
@expirationdate,
@username,
@Title,
@RFPCategory,
@commodity,
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
Created=@Created,
activation_date=@activationdate,
expiration_date=@expirationdate,
username=@username,
Title=@Title,
RFPCategory=@RFPCategory,
commodity=@commodity,
RFPDescription=@RFPDescription,
ZipCode=@ZipCode,
City=@City,
State=@State,
sourceurl=@sourceurl,
orgname=@orgname,
datekey=@datekey,
ItemID=@ItemID,
ItemSourceName=@ItemSourceName,
system_file_name=@filename;
EOF
rm temp.xml
echo 'SQL load succesful'