#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR
source ../../bashsrc

step 1

echo "Performing schema migration, but ignoring data in the csv file"
echo "rdbm -c test.cfg --etl=ignore migrate; with params:"
cat test.cfg
../../rdbm -c test.cfg --etl=ignore --db_port $1 migrate

rm -f D1__test_schema_test_copy.csv

step 2

echo "Exporting data to CSV file using VIEW for Transform:"
echo
echo "rdbm -c test.cfg --snapshot_data=test_copy:vw_test_snapshot snapshot"
../../rdbm -c test.cfg --db_port $1 --snapshot_data=test_schema.test_copy:vw_test_snapshot --snapshot_to=test_schema.out.yaml snapshot

step 3

echo "Loading database with data from the external CSV file"
echo
echo "rdbm -c test.cfg migrate; with params:"
../../rdbm -c test.cfg --db_port $1 migrate


sql="select * from test_schema.test_copy"
psql -t -h localhost -U postgres -p $1 -c "$sql" > test_copy_result.out.txt

echo "Data: SQL> $sql"
cat test_copy_result.out.txt

echo "Comparing SQL files: diff output vs expected"
diff -B -w test_copy_result.txt test_copy_result.out.txt

echo
