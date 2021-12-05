# Rumba[rdbm] test case: ETL

Extract Transform Load example in tree steps:

1. Load CSV and SQL into DB tables
2. Extract data to CSV using VIEW for Transform
3. Load data from CSV into a new table


```
../test.sh etl

```
OR to keep console open for manual checkup
```
../test.sh etl psql

```

