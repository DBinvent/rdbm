#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR

echo
echo "Performing tagged migration :> rdbm -c test.cfg migrate; with params:"
cat test.cfg

../../rdbm -c test.cfg --db_port $1 migrate

echo "Dumping info test_result.out.txt>"
../../rdbm -c test.cfg --db_port $1 info | grep -v executed_on > test_result.out.txt
cat test_result.out.txt

echo "Comparing: diff output vs expected"
diff -B test_result.txt test_result.out.txt

echo
