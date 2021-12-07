#!/bin/bash
cd $(dirname $0)

echo
echo "deploying :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
useradd -d /home/test rumba

su - rumba bash -c "./rdbm -c test.cfg migrate"

echo "Check DB: \dt >"
psql -U postgres rumba -c "\dt" 2> test_result.out.txt
cat test_result.out.txt

diff -B test_result.txt test_result.out.txt


chmod a+rw *
