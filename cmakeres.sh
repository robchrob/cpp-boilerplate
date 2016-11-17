#!/bin/bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)

mkdir -p $SCRIPTPATH/build
cd $SCRIPTPATH/build/
rm -r *
cd ..
./compile.sh
./compile.sh #TODO, json database is not created at first time (?)
