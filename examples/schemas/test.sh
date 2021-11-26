#!/bin/bash
cd $(dirname $0)

echo
echo STEP#1
echo
echo "deploying up to version 1:> /rdbm -c test.cfg  --target=1 migrate; with params:"
cat test.cfg
./rdbm -c test.cfg --target=1 migrate

#comparasion

echo
echo "Dumping schema of version 1 in YAML format:> rdbm -c test.cfg snapshot"
./rdbm -c test.cfg --snapshot_to=test1_result.out.yaml snapshot

echo "Compare YAML results: diff original vs output"
diff -B test1_result.yaml test1_result.out.yaml

echo
echo "Dumping schema of version 1 in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test1_result.out.sql

echo "Compare SQL results: diff original vs output"
diff -B test1_result.sql test1_result.out.sql

echo
echo STEP#2
echo
echo "deploying up to version 2:> /rdbm -c test.cfg  --target=2 migrate; with params:"
cat test.cfg
./rdbm -c test.cfg --target=2 migrate

#comparasion

echo
echo "Dumping schema of version 2 in YAML format:> rdbm -c test.cfg snapshot"
./rdbm -c test.cfg --snapshot_to=test2_result.out.yaml snapshot

echo "Compare YAML results: diff original vs output"
diff -B test2_result.yaml test2_result.out.yaml

echo
echo "Dumping schema of version 2 in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test2_result.out.sql

echo "Compare SQL results: diff original vs output"
diff -B test2_result.sql test2_result.out.sql


chmod a+rw *
