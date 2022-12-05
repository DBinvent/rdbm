#!/bin/bash
cd $(dirname $0)

echo "Deploying YAML and SQL scripts:> rdbm -c test.cfg migrate; with params:"
cat test.cfg
./rdbm -c test.cfg migrate

echo
echo "Dumping schema into YAML file:> rdbm -c test.cfg snapshot"
./rdbm -c test.cfg snapshot > test_result.out.yaml

echo "Comparing YAML files: diff output vs expected"
diff -B test_result.yaml test_result.out.yaml

echo
echo "Dumping schema into SQL file:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test_result.sql test_result.out.sql

chmod a+rw *
