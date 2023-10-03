#!/bin/sh

source setenv.sh

rm -rf $HYKU_DIR

cp -R hyku/. $HYKU_DIR

source customize.sh