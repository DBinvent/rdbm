#!/bin/bash
if [ $# -lt 1 ]; then
  echo "Run a test cases for Rumba[rdbm] in Postgres Docker container"
  echo "Example: $0 baseline"
  echo ""
  echo "Available test cases:"
  ls -1 examples
  echo ""
  echo "Use '$0 <test case> psql' to keep container open"
  exit 1
fi

#if [ ! -d "examples/$1/test.sh" ]; then
if [ ! -f "examples/$1/test.sh" ]; then
  echo "examples/$1 is not a valid test case directory"
  exit 1
fi

set -e

if [ -f rdbm ]; then
  echo "Use $(rdbm -V)"
else
  echo "Install Rumba the rdbm"
  wget https://dev.dbinvent.com/dist/rdbm-unix-latest.tar.gz
  tar xvf rdbm-unix-latest.tar.gz
  rdbm -V
fi

echo "Starting Postgres in Docker container..."
docker pull postgres

alreadystarted=$(docker ps -a -f "name=rumba-test" -q)
if [ -n "$alreadystarted" ]; then
 echo Stop and clean previously started Postgres in Docker container: $alreadystarted
  docker stop $alreadystarted
  docker rm $alreadystarted
fi

cd $(dirname $0)
cp -t examples/$1 rdbm evaluation.license

containerid=$(docker run --name rumba-test -v $(pwd)/examples/$1:/home/test -i -d -e POSTGRES_PASSWORD=pwd postgres)
sleep 3
started=$(docker ps -f "name=rumba-test" -q)
echo Stared Postgres in Docker container: $started
cid=${containerid:0:12}

echo ""
echo "Executing test cases from examples/$0 ..."
docker exec -it rumba-test bash -e /home/test/test.sh


echo ""
echo "Test case [$1] completed!"
echo "You can check results at examples/$1/*.out file(s)"

if [ $# -eq 2 ]; then
  echo ""
  if [ $2 == "psql" ]; then
    echo "Jump into Docker interactive PSQL console. Type '\q' to exit ..."
    echo "Use: 'select * from rdbm_history'"
    it="-h localhost -U postgres"
  fi
  if [ $2 == "bash" ]; then
    echo "Jump into Docker interactive Bash console. Type 'exit' when done ..."
    echo "Use: rdbm help"
    echo "rdbm --dry_run=yes -c test.cfg  license"
    it="/home/test/bashrc"
  fi
  docker exec -it rumba-test $2 $it
fi

echo "Stop and Cleanup Docker container:"
docker stop $cid && docker rm $cid
