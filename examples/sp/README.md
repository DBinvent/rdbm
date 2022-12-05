# Stored procedure

This test case is demonstrating [repeatable scripts](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) execution on every performed migration.

Initially, it performs schema migration that creates a stored procedure with ‘first’ string in its code. Then it simulates the procedure source code changes by replacing the file and repeats the migration again.

Rumba RDBM detects the changes by comparing the current file hash with its previous value from the history table and runs the changed repeatable script.

## Running the test

```shell
../test.sh sp
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh sp psql
```
