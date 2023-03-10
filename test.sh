#!/bin/bash

port=${PG_PORT:-5444}
pg_ver=${PG_VERSION:-14}
SCRIPT_DIR=$(dirname $(realpath "$0"))

if [ $# -lt 1 ]; then
  echo "Run a test case for Schema Guard in Postgres Docker container"
  echo "Example: $0 baseline"
  echo ""
  echo "Available test cases:"
  ls -1 examples
  echo ""
  echo "Use '$0 <test case> psql' to keep container open"
  echo "Or '$0 <test case> bash' to play with: 'rdbm help'"
  exit 1
fi

cd $SCRIPT_DIR


if [ -f "$1/test.sh" ]; then
  test=$1
else
 if [ -f "examples/$1/test.sh" ]; then
   test=examples/$1
   else
   echo "examples/$1 is not a valid test case directory"
   exit 1
 fi
fi

set -e

if [ -f rdbm ]; then
  echo "Use $(./rdbm -V)"
else
  echo "Pull Schema Guard from dbinvent.com"
  wget https://www.dbinvent.com/dist/rdbm-unix-latest.tar.gz
  tar xvf rdbm-unix-latest.tar.gz
  ./rdbm -V
fi

echo "Starting Postgres in the Docker container..."
#docker pull postgres

alreadystarted=$(docker ps -a -f "name=schema-guard" -q)
if [ -n "$alreadystarted" ]; then
 echo Stop and clean previously started Postgres in Docker container: $alreadystarted
  docker stop $alreadystarted
  docker rm $alreadystarted
fi

# Start Postgres
containerid=$(docker run --rm --name schema-guard -p $port:5432 -i -d -e POSTGRES_PASSWORD=pwd postgres:$pg_ver)

sleep 3
started=$(docker ps -f "name=schema-guard" -q)
echo Stared Postgres in Docker container: $started
cid=${containerid:0:12}

echo ""
echo "Executing test cases from examples/$1 ..."

set +e

PGPASSWORD=pwd $SCRIPT_DIR/$test/test.sh $port
test_result=$?

if [[ $test_result -eq 0 ]]; then
    echo "Test case [$1] completed SUCCESSFULLY!"
 else
    echo "Test case [$1] FAILED!"
fi
#docker exec -it schema-guard bash -e /home/test/test.sh  || (echo FAILED TEST: $1 && exit 1)


echo ""
echo "You can check results at examples/$1/*.out file(s)"

if [ $# -eq 2 ]; then
  echo ""
  if [ $2 == "psql" ]; then
    echo "Jump into the Docker interactive PSQL console. Type '\q' to exit ..."
    echo "Try to use: 'select * from rdbm_history;'"
    PGPASSWORD=pwd psql -h localhost -p $port postgres
    bash
  fi
  if [ $2 == "bash" ]; then
    echo "Jump into the Docker interactive Bash console. Type 'exit' when done ..."
    echo "Try to use: 'rdbm help'"
    bash
  fi
fi

echo "Stop and Cleanup Docker container:"
docker stop $cid && docker rm $cid

exit $test_result

# cleanup
# docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi
