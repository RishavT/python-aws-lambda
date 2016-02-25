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

virtualenv_="/usr/bin/env python2 -m virtualenv"

if [ -z "$1" -o "$1" = "--help" -o "$1" = "-h" ]
    then
        echo "create_lambda.sh"
        echo "To create a new lambda function called `foo` in $(pwd), run:"
        echo "create_lambda.sh foo new"
        echo "And a new directory (with required files for a demo lambda function) \
will get created."
        echo "\nTo update the build scripts of an existing lambda function, run: "
        echo "create_lambda.sh foo"
        exit 0
fi

# Get parent directory of this script
original_file=$(readlink $0)
echo 'lol'
echo $original_file

if [ "$original_file" = '' ]
    then
        original_file=$0
fi

SCRIPT_DIRECTORY=$(dirname $original_file)
echo $SCRIPT_DIRECTORY

if [ "$2" = 'new' ]
    then
        mkdir $1
        $virtualenv_ ./$1
        mkdir ./$1/app

        # Copy sample handler function
        cp $SCRIPT_DIRECTORY/handler.py $1/app/
fi

echo $0
pwd -P
# Copy building script
cp $SCRIPT_DIRECTORY/build.sh $1
chmod +x $1/build.sh

echo 'Successfully created new lambda app $1'
echo 'To build the zip for uploading, run $1/build.sh build'
echo 'To upload the zip to your AWS web services, run $1/build.sh publish'
echo '* The folder name ($1) should be the same as the lambda function name'
echo '* And you have to provied `handler/handler` as the module to run in lambda.'
echo '* Unless you change the file/function names.'
