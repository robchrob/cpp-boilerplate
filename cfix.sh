#!/bin/bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)

clang-tidy -p=$SCRIPTPATH/build/ $SCRIPTPATH/src/*.[ch]pp -fix 2> /dev/null
