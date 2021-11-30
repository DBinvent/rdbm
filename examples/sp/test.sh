#!/bin/bash
cd $(dirname $0)

echo
echo STEP#1
echo
echo "deploying first version of a store proc code :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
cp sp_first.sql R1__sp.sql
./rdbm -c test.cfg migrate

echo
echo "Getting result of first store proc code:sql> select test_sp();"
psql -t -h localhost -U postgres -c "select test_sp()" > test1_result.out.txt

echo "Compare results: diff original vs output"
diff -B test1_result.txt test1_result.out.txt

echo
echo STEP#2
echo
echo "Assume the code changed: apply by override previous file:> cp r1__sp_updated.sql R1__sp.sql "
cp sp_second.sql R1__sp.sql
echo "deploying second version of a store proc code (same migration version) :> rdbm -c test.cfg migrate; with params:"
./rdbm -c test.cfg migrate

echo "Getting result of second store proc code:sql> select test_sp();"
psql -t -h localhost -U postgres -c "select test_sp()" > test2_result.out.txt

echo "Compare results: diff original vs output"
diff -B test2_result.txt test2_result.out.txt


chmod a+rw *
