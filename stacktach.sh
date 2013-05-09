#!/bin/bash

. stacktach-config.sh

export DJANGO_SETTINGS_MODULE=settings
export STACKTACH_DB_NAME=stacktach
export STACKTACH_DB_HOST=localhost
export STACKTACH_DB_USERNAME=root
export STACKTACH_DB_PASSWORD=$MYSQL_PASSWORD
export STACKTACH_INSTALL_DIR=~/stacktach_app/

. stacktach/init.sh
. stacktach/run.sh
