#!/bin/bash

# For SCL enablement
source /etc/profile.d/httpd24-enable.sh

set -eu

set -x

if [ "$1" = "httpd" ]; then
	shift
	set -- httpd -DFOREGROUND -d /opt/openshift/httpd/ "$@"
fi

exec "$@"
