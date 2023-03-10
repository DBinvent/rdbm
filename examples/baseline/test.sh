#!/bin/bash
set -Eeu

SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR

echo "Checking the license:> rdbm --dry_run=1 -c test.cfg $1 license"
../../rdbm --dry_run=1 -c test.cfg --db_port $1 license
echo
echo "Creating history table for future migrations:> rdbm -c test.cfg prepare; with params:"
cat test.cfg
echo
../../rdbm -c test.cfg --db_port $1 prepare

echo
echo "Dumping the schema in YAML format:> rdbm -c test.cfg snapshot"
../../rdbm -c test.cfg --db_port $1 --snapshot_to=test_result.out.yaml snapshot

echo "Comparing YAML files: diff output vs expected"
diff -B test_result.yaml test_result.out.yaml

echo
echo "Dumping the schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres -p $1 | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test_result.sql test_result.out.sql

echo