# Declarative schema model in YAML files

This test case performs two database schema migrations: to schema version 1, then to version 2. Each time, it dumps and compares the resulting schema with the reference data.

> In the `S2_0__schema.yaml` file we add a new column without providing full columns list from the previous schema version `S1_0__schema.yaml`

## Running the test

```shell
../test.sh schemas
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh schemas psql
```
