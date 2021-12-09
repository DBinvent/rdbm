#!/bin/bash
cd $(dirname $0)

echo
echo "deploying :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
useradd -d /home/test rumba

su - rumba bash -c "./rdbm -c test.cfg migrate"

psql -U postgres -f after.sql rumba > "test_db.out"

echo "Dump History records from DB (test_db.out)>"
cat test_db.out

psql -U postgres -f after.sql postgres > "test_logdb.out"
echo "Dump History records from LogDB (test_logdb.out)>"
cat test_logdb.out

diff -I connected test_db.out test_logdb.out && echo "is same"

chmod a+rw *
