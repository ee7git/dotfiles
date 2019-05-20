#!/bin/bash

logger -t DuckDNS "Updating DuckDNS entries"
set +o history
EXITCODE=0
DUCK_DOMAIN=''
DUCK_TOKEN=''
OUTPUT=$(curl -k -s "https://www.duckdns.org/update?domains=${DUCK_DOMAIN}&token=${DUCK_TOKEN}&ip=")
logger -t DuckDNS ${OUTPUT}
set -o history
if [ "${OUTPUT}" == "KO" ]; then
	logger -t DuckDNS "You should check if your domain/token is correct because the server responded negatively!"
	EXITCODE=1
fi
exit $EXITCODE
