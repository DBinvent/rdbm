#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR

echo
echo "Creating a new database with history table:> rdbm -c test.cfg prepare; using configuration:"
cat test.cfg
../../rdbm -c test.cfg --db_port $1 prepare

psql -h localhost -p $1 -U rumba -c "\c" rumba > "test.out"

diff -B test.out test.result

echo