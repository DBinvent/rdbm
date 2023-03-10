#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR
source ../../bashsrc

echo
echo "Performing schema migration :> rdbm -c test.cfg migrate; with params:"
cat test.cfg

../../rdbm -c test.cfg --db_port $1 --logdb_port $1 migrate

echo "Dumping remote History Table (test_db.out)..."
psql -U postgres -f export.sql -h localhost -p $1 rumba > "test_db.out"

cat test_db.out

echo "Dumping local History Table (test_logdb.out)>"
psql -U postgres -f export.sql -h localhost -p $1 postgres > "test_logdb.out"

cat test_logdb.out

diff -I connected test_db.out test_logdb.out && echo "Exact match"

echo