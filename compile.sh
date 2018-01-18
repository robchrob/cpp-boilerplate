#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)

mkdir -p $SCRIPTPATH/build/ &&\
cd $SCRIPTPATH/build/ &&\
cmake .. &&\
make
