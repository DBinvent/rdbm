#!/bin/bash
set -e
cd $(dirname $0)
basedir=$(pwd)
cd examples

for f in * ; do
  if [ -f "$f"/test.sh ]; then
    echo
    echo "Starting test case: [$f]"
    echo
    "$basedir"/test.sh "$f"
    cd "$basedir/examples"
    printf '=%.0s' {1..80}
  fi
done
echo
echo "Well done -- All tests completed successfully!"
