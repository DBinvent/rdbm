#!/bin/bash
cd $(dirname $0)

export DB_NAME=postgres
export DB_HOST=localhost
export DB_USER=postgres
export DB_PASSWORD=pwd

echo "Creating history table for the future migrations:> rdbm prepare; with params:"
env | grep DB_
./rdbm prepare

echo
echo "Dumping the schema in SQL format:>  pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing SQL files: diff output vs expected"
diff -B test_result.sql test_result.out.sql

chmod a+rw *
