# Extract Transform Load #3

This test case is demonstrating initial data load from CSV files in tables that have no relation set. [D-file's](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) version number, in file names, set the insertion order.

Initially, [Schema Guard](https://www.dbinvent.com/rdbm/) generates and executes the SQL commands to create the schema described in YAML file, then proceeds to the files from the `etl:` section.

## Running the test

```shell
../test.sh s3etl
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh s3etl psql
```
