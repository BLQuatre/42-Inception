#!/bin/sh

set -e

DB_PATH="/app/data/kuma.db"

node server/server.js &

while [ ! -f "$DB_PATH" ]; do
	sleep 2;
done

pkill -f "node server/server.js"

export CRYPTED_UPKUMA_PASSWORD=$(htpasswd -bnBC 10 "" ${UPKUMA_PASSWORD} | tr -d ':\n')

if [ -f "/tools/init.sql" ]; then
echo "init sql"
	envsubst < /tools/init.sql | sqlite3 /app/data/kuma.db
fi

node server/server.js
