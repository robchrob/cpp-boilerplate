#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)

$SCRIPTPATH/bin/boiler_test $@
