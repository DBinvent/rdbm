#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR

echo
echo "Running the migration under specific user :> rdbm -c test.cfg migrate; with params:"

cat test.cfg
../../rdbm -c test.cfg --db_port $1 migrate

echo "Dumping the result: \dt >"
psql -h localhost -p $1 -U postgres rumba -c "\dt" 2> test_result.out.txt
cat test_result.out.txt

echo "Comparing files: diff output vs expected"
diff -B test_result.txt test_result.out.txt

echo
