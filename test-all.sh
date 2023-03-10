#!/bin/bash
set -Eeu
SCRIPT_DIR=$(dirname $(realpath "$0"))
cd $SCRIPT_DIR/examples

for f in * ; do
  if [ -f "$f"/test.sh ]; then
    echo
    echo "Starting test case: [$f]"
    echo
    "$SCRIPT_DIR"/test.sh "$f"
    cd "$SCRIPT_DIR/examples"
    printf '=%.0s' {1..80}
  fi
done
echo
echo "Well done -- All tests completed successfully!"
