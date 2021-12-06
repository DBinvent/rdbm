#!/bin/bash
cd $(dirname $0)
source ./bashsrc

step 1

echo "Deploying tables with data :> (ignoring absent csv data file)"
echo "rdbm -c test.cfg --etl=ignore migrate; with params:"
cat test.cfg
./rdbm -c test.cfg --etl=ignore migrate

rm -f D1__test_schema_test_copy.csv

step 2

echo "Extact data to CSV using VIEW for Transform :"
echo
echo "rdbm -c test.cfg --snapshot_data=test_copy:vw_test_snapshot snapshot"
./rdbm -c test.cfg --snapshot_data=test_schema.test_copy:vw_test_snapshot --snapshot_to=test_schema.out.yaml snapshot

step 3

echo "Load data from CSV into new table"
echo
echo "rdbm -c test.cfg migrate; with params:"
./rdbm -c test.cfg migrate


sql="select * from test_schema.test_copy"
psql -t -h localhost -U postgres -c "$sql" > test_copy_result.out.txt

echo "Data: SQL> $sql"
cat test_copy_result.out.txt

diff -B -w test_copy_result.txt test_copy_result.out.txt

chmod a+rw *
