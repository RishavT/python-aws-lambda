#!/bin/bash

if [ "$1" == 'publish' ]
    then
        aws lambda update-function-code\
        --function-name ${PWD##*/} --zip-file fileb://$(pwd)/dist.zip --publish
fi

if [ "$1" == 'build' ]
    then
        rm -rf ./dist
        mkdir ./dist
        find ./app -name "*.pyc" -exec rm -rf {} \;
        cp -r ./app/* dist/
        cp -r ./lib/python2.7/site-packages/* dist/
        cd dist/
        zip -r1v ../dist.zip ./*
fi
