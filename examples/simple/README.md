# Simple schema migration

This test case performs a schema migration defined in [S-type](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) YAML file, then does a few inserts defined in [V-type](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) SQL script.

## Running the test

```shell
../test.sh simple
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh simple psql
```
