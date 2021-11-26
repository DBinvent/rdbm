#!/bin/bash
cd $(dirname $0)

echo "Deploying YAML and SQL scripts:> /rdbm -c test.cfg migrate; with params:"
cat test.cfg
./rdbm -c test.cfg migrate


sed 's/\$USER/postgres/g' test.result.yaml > test.result.yaml.org
sed 's/\$USER/postgres/g' test.result > test.result.org
echo
echo "Dumping schema in YAML format:> rdbm -c test.cfg snapshot"
./rdbm -c test.cfg snapshot > test.result.yaml.out

echo "Compare YAML results: diff original vs output"
diff -B test.result.yaml.org test.result.yaml.out

echo
echo "Dumping schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test.result.out

echo "Compare SQL results: diff original vs output"
diff -B test.result.org test.result.out

chmod a+rw *
