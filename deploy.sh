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

rm -rf ${HYKU_DIR}.old
mkdir -p $HYKU_DIR 
mv $HYKU_DIR ${HYKU_DIR}.old
if [ $? != 0 ]; then
	error_fail "Failed to backup ${HYKU_DIR}."
fi
rm -rf $HYKU_DIR
mkdir $HYKU_DIR
cp -R hyku/. $HYKU_DIR

source customize.sh
