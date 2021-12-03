#!/bin/bash
cd $(dirname $0)

echo
echo "Deploying tables with data :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
./rdbm -c test.cfg migrate

sql="select tt.*, tr.* from test_schema.test_table tt join test_schema.test_ref_table tr on tt.tr=tr.id"
psql -t -h localhost -U postgres -c "$sql" > test_result.out.txt

echo "Data: SQL> $sql"
cat test_result.out.txt

diff -B -w test_result.txt test_result.out.txt

lsql="select version, source, times from public.rdbm_history where source_type='D' and ok"
psql -t -h localhost -U postgres -c "$lsql" > log_result.out.txt

echo "History: SQL> $lsql"
cat log_result.out.txt

diff -B -w log_result.txt log_result.out.txt

chmod a+rw *
