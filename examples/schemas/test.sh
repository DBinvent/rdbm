#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR
source ../../bashsrc

echo "Migrating schema to version 1:> rdbm -c test.cfg  --target=1 migrate; with params:"
cat test.cfg
../../rdbm -c test.cfg --db_port $1 --target=1 migrate

step 1

echo
echo "Dumping version 1 schema into YAML file:> rdbm -c test.cfg snapshot"
../../rdbm -c test.cfg --db_port $1 --snapshot_to=test1_result.out.yaml snapshot

echo "Comparing YAML files: diff output vs expected"
diff -B test1_result.yaml test1_result.out.yaml

echo
echo "Dumping version 1 schema into SQL file:>  pg_dump -s -h "
pg_dump -s -h localhost -p $1 -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test1_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test1_result.sql test1_result.out.sql

step 2

echo "Migrating schema to version 2:> rdbm -c test.cfg  --target=2 migrate; with params:"
cat test.cfg
../../rdbm -c test.cfg --db_port $1 --target=2 migrate

# Comparison

echo
echo "Dumping version 2 schema into YAML file:> rdbm -c test.cfg snapshot"
../../rdbm -c test.cfg --db_port $1 --snapshot_to=test2_result.out.yaml snapshot

echo "Comparing YAML files: diff output vs expected"
diff -B test2_result.yaml test2_result.out.yaml

echo
echo "Dumping version 2 schema into SQL file:>  pg_dump -s -h "
pg_dump -s -h localhost -p $1 -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test2_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test2_result.sql test2_result.out.sql


echo
