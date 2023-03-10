#!/bin/bash
set -Eeu
SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR

echo "Deploying YAML and SQL scripts:> rdbm -c test.cfg migrate; with params:"
cat test.cfg
../../rdbm -c test.cfg --db_port $1 migrate

echo
echo "Dumping schema into YAML file:> rdbm -c test.cfg snapshot"
../../rdbm -c test.cfg --db_port $1 --snapshot_to=test_result.out.yaml snapshot

echo "Comparing YAML files: diff output vs expected"
diff -B test_result.yaml test_result.out.yaml

echo
echo "Dumping schema into SQL file:>  pg_dump -s -h "
pg_dump -s -h localhost -p $1 -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test_result.sql test_result.out.sql

echo
