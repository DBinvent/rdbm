#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR
source ../../bashsrc

step 1

echo "Deploying the first version of stored procedure code :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
cp sp_first.sql R1__sp.sql
../../rdbm -c test.cfg --db_port $1 migrate

echo
echo "Getting result, expecting first version :sql> select test_sp();"
psql -t -h localhost -p $1 -U postgres -c "select test_sp()" > test1_result.out.txt

echo "Comparing: diff output vs expected first version"
diff -B test1_result.txt test1_result.out.txt

step 1

echo "Simulating code changes: Overwriting previous file :> cp r1__sp_updated.sql R1__sp.sql "
cp sp_second.sql R1__sp.sql
echo "Deploying the second version of stored procedure code :> rdbm -c test.cfg migrate; with params:"
../../rdbm -c test.cfg --db_port $1 migrate

echo "Getting result, expecting second version :sql> select test_sp();"
psql -t -h localhost -p $1 -U postgres -c "select test_sp()" > test2_result.out.txt

echo "Comparing: diff output vs expected second version"
diff -B test2_result.txt test2_result.out.txt


echo
