# Extract Transform Load #2

This test case is demonstrating initial data load from CSV files in the tables linked by foreign key. Initially, [Rumba RDBM](https://www.dbinvent.com/rdbm/) generates and executes the SQL commands to create the schema described in YAML file, then proceeds to the files from the `etl:` section.

## Running the test

```shell
../test.sh s2etl
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh s2etl psql
```
