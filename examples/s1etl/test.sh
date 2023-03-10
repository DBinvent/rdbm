#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR
source ../../bashsrc

echo
echo "Migration and initial data load from an external file :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
../../rdbm -c test.cfg --db_port $1 migrate

sql="select * from test_schema.test_table"
psql -t -h localhost -p $1 -U postgres -c "$sql" > test_result.out.txt

echo "Data: SQL> $sql"
cat test_result.out.txt

diff -B -w test_result.txt test_result.out.txt

lsql="select version, source, times from public.rdbm_history where source_type='D' and ok"
psql -t -h localhost -p $1 -U postgres -c "$lsql" > log_result.out.txt

echo "History: SQL> $lsql"
cat log_result.out.txt

diff -B -w log_result.txt log_result.out.txt

echo
