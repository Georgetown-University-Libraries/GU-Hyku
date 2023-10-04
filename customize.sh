#!/bin/sh

function error_fail {
	echo "ERROR: $1"
	echo "Exiting deploy."
	exit 1
}

source setenv.sh
if [ $? != 0 ]; then
	error_fail "Failed to load 'setenv.sh' and set environment variables."
fi

cp -R customizations/. $HYKU_DIR
