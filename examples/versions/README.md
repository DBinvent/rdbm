# Two versions, SQL files

This test case is demonstrating initial database schema creation, then migration to the next schema version. Immutable [V-type](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) SQL scripts are used.

You can do the same by defining a declarative model in the mutable YAML files, here is [an example](https://github.com/DBinvent/rdbm/blob/main/examples/schemas).

[Rumba RDBM](https://www.dbinvent.com/rdbm/) allows you to mix both: declarative schema model in YAML files and plain-SQL scripts. Please refer to [Mixing SQL with YAML](examples/sql-and-yaml) example.

## Running the test

```shell
../test.sh versions
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh versions psql
```
