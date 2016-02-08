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

if [ "$2" = 'new' ]
    then
        mkdir $1
        virtualenv2 ./$1
        mkdir ./$1/app

        #Create sample handler
        echo '"""Handler for thelambda function.
        This the file which will run when the API endpoint is hit."""

        def handler(event, context):
            """
            Handler function. This function will run when the API is hit.
            """
            return event
        ' > $1/app/handler.py
fi
cd $1
echo $0
pwd -P
#Copy building script
original_file=$(readlink $0)
echo $original_file
if [ "$original_file" = '' ]
    then
        original_file=$0
fi
echo $original_file
cp $(dirname $original_file)/build.sh .
chmod +x build.sh
# touch build.sh
# chmod +x build.sh
# echo '#!/bin/bash
# rm -rf ./dist
# mkdir ./dist
# find ./app -name "*.pyc" -exec rm -rf {} \;
# cp -r ./app/* dist/
# cp -r ./lib/python2.7/site-packages/* dist/
# cd dist/
# zip -r1v ../dist.zip ./*' > build.sh

echo 'Successfully created new lambda app $1'
