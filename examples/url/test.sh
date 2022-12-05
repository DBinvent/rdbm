#!/bin/bash
cd $(dirname $0)

url=postgresql://postgres:pwd@localhost/postgres

echo "Deploying history table:> rdbm --db_url=$url prepare"
./rdbm --db_url=$url prepare

echo
echo "Dumping schema in SQL format:> pg_dump -s -h "
pg_dump -s -h localhost -U postgres | grep -Ev "\-\-|SET|COMMENT ON|pg_catalog.set_config" > test_result.out.sql

echo "Comparing: diff output vs expected"
diff -B test_result.sql test_result.out.sql

step 1 || true

chmod a+rw *
