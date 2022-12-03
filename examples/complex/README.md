# Complex

This test case mixes the declarative schema definition in YAML file with direct schema manipulations by plain-SQL script. It also demonstrates `P` type script usage for creating a stored function and PostgreSQL extension before the migration start, and runs `R` type script for repeatable updates after each database schema migration.

> You can find the details about script types, versioning and script execution order in [Script Versions and Types](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) article.

## Running the test

```shell
../test.sh complex
```

