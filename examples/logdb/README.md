# Rumba[rdbm] test case: LogDB 

Main goal is a copy history data to a secondary database.

2. Perform migration

3. Dump schema in YAML and compare results 

4. PG_Dump schema in SQL and compare results 

How separate log DB is useful:
1. split access to DB 
2. copy without additional effort


```
../test.sh logdb

```
OR to keep console open for manual checkup
```
../test.sh logdb psql

```

