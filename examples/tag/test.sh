#!/bin/bash
cd $(dirname $0)

echo
echo "deploying :> rdbm -c test.cfg migrate; with params:"
cat test.cfg
useradd -d /home/test rumba

su - rumba bash -c "./rdbm -c test.cfg migrate"
echo "Dump info into test_result.out.txt>"
./rdbm -c test.cfg info | grep -v executed_on > test_result.out.txt
cat test_result.out.txt

diff -B test_result.txt test_result.out.txt


chmod a+rw *
