#!/bin/bash
cd $(dirname $0)

echo
echo "Performing schema migration :> rdbm -c test.cfg migrate; with params:"
cat test.cfg

useradd -d /home/test rumba
su - rumba bash -c "./rdbm -c test.cfg migrate"

echo "Dumping remote History Table (test_db.out)..."
psql -U postgres -f export.sql rumba > "test_db.out"

cat test_db.out

echo "Dumping local History Table (test_logdb.out)>"
psql -U postgres -f export.sql postgres > "test_logdb.out"

cat test_logdb.out

diff -I connected test_db.out test_logdb.out && echo "Exact match"

chmod a+rw *
