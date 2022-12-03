#!/bin/bash
cd $(dirname $0)

echo "Checking the license:> rdbm --dry_run=1 -c test.cfg  license"
./rdbm --dry_run=1 -c test.cfg  license
echo
echo "Creating history table for future migrations:> rdbm -c test.cfg prepare; with params:"
cat test.cfg
./rdbm -c test.cfg prepare

echo
echo "Dumping the schema in YAML format:> rdbm -c test.cfg snapshot"
./rdbm -c test.cfg --snapshot_to=test_result.out.yaml snapshot

echo "Comparing YAML files: diff output vs expected"
diff -B test_result.yaml test_result.out.yaml

echo
echo "Dumping the schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test_result.sql test_result.out.sql

chmod a+rw *
