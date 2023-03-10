#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR

echo "Creating history table for the future migrations:> rdbm prepare; with params:"

DB_NAME=postgres \
DB_HOST=localhost \
DB_USER=postgres \
DB_PASSWORD=pwd \
DB_PORT=$1 \
../../rdbm prepare

echo
echo "Dumping the schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres -p $1 | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test_result.sql test_result.out.sql

echo
