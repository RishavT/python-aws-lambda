#!/bin/bash
# Author: Rishav Thakker
# Script to initiate a new lambda application
# Creates a folder, initiates a virtualenv inside it, and creates a demo
# lambda handler inside the app folder
#
# Also includes a build.sh which copies all installed python pip modules,
# and everything inside the app folder into dist/ and creates a zip, which
# can then be uploaded to the Amazon lambda console.
#
# Takes the name of the lambda app as parameter.

mkdir $1
cd $1
virtualenv2 .
mkdir app

#Create building script
touch build.sh
chmod +x build.sh
echo '#!/bin/bash
rm -rf ./dist
mkdir ./dist
cp -r ./app/* dist/
cp -r ./lib/python2.7/site-packages/* dist/
cd dist/
zip -r1v ../dist.zip ./*' > build.sh

#Create sample handler
cd app
touch handler.py
echo '"""Handler for thelambda function.
This the file which will run when the API endpoint is hit."""

def handler(event, context):
    """
    Handler function. This function will run when the API is hit.
    """
    return event
' > handler.py

echo 'Successfully created new lambda app $1'
