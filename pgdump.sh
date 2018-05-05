#!/usr/bin/env bash

cd /script

echo "$HOST $USERNAME $PORT $DATABASE"

if [ -z ${HOST+x} ]; then
	read -p "Host: " HOST
fi

if [ -z ${USERNAME+x} ]; then
	read -p "Username: " USERNAME
fi

if [ -z ${PORT+x} ]; then
	read -p "Port: " PORT
fi

if [ -z ${DATABASE+x} ]; then
	read -p "Database: " DATABASE
fi

read -sp "Password: " PASSWORD

echo ""

export PGPASSWORD=$PASSWORD

echo "Starting pg_dump..."


if [ -z ${DUMPALL+x} ]; then
	pg_dump --host=$HOST --username=$USERNAME --port=$PORT $DATABASE > /output/$DATABASE.sql
else 
	echo "Starting pg_dumpall..."
	pg_dumpall --host=$HOST --username=$USERNAME --port=$PORT --database=$DATABASE > /output/dump-all.sql
fi

echo "Done!"