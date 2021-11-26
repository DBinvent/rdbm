#!/bin/bash
cd $(dirname $0)

echo "Deploying YAML and SQL scripts:> /rdbm -c test.cfg migrate; with params:"
cat test.cfg
./rdbm -c test.cfg migrate

echo
echo "Dumping schema in YAML format:> rdbm -c test.cfg snapshot"
./rdbm -c test.cfg snapshot > test_result.out.yaml

echo "Compare YAML results: diff original vs output"
diff -B test_result.yaml test_result.out.yaml

echo
echo "Dumping schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Compare SQL results: diff original vs output"
diff -B test_result.sql test_result.out.sql

chmod a+rw *
