# ETL

This test case is demonstrating **E**xtract **T**ransform **L**oad operations. It shows how to ignore the data referenced from YAML file, extracts rows from the database into the CVS file and loads the database with data from external CSV file.

## Running the test

```shell
../test.sh etl
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh etl psql
```
