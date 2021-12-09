#!/bin/bash
cd $(dirname $0)

export DB_NAME=postgres
export DB_HOST=localhost
export DB_USER=postgres
export DB_PASSWORD=pwd

echo "Deploying history table as baseline migration:> rdbm prepare; with params:"
env | grep DB_
./rdbm prepare

echo
echo "Dumping schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Compare SQL results: diff original vs output"
diff -B test_result.sql test_result.out.sql

chmod a+rw *
