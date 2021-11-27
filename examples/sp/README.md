# Rumba[rdbm] test case: Store Procedure

Using repeatable migration to handle DB based code, like Stored Procedures updated by Source control lit git.

This test case demonstrate the same migration version but changing SP code.  

The code not limited to be a function but any type of script which is correct for repeatable execution on the same database.

```
../test.sh sp

```
OR to keep console open for manual checkup
```
../test.sh sp psql

```

