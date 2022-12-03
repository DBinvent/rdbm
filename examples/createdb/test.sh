#!/bin/bash
cd $(dirname $0)

echo
echo "Creating a new database with history table:> rdbm -c test.cfg prepare; using configuration:"
cat test.cfg
./rdbm -c test.cfg prepare

psql -U rumba -c "\c" rumba > "test.out"

diff -B test.out test.result

chmod a+rw *
