# Extract Transform Load #1

This test case is demonstrating how to fill the table from CSV file, leaving the primary key generation to PostgreSQL. Right after the schema has been changed, `rdbm` will perform an initial data load from the file. The YAML file describes the table schema and primary key, but the CSV file has no data for the primary key column.

##Running the test

```shell
../test.sh s1etl

```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh s1etl psql
```
