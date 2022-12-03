# Baseline

This test case is demonstrating a license check, _prepare_ command usage and executing `A` type script at the end. It creates a history table with the name provided in the configuration file, rather than using a default table name.

> Rumba RDBM accepts configuration parameters from the command-line, configuration file, and environment variables. So, you can set parameters from `test.cfg` in different ways. Please consult [Configuration](https://www.dbinvent.com/rdbm/guide/configuration) article about details.

## Running the test
```shell
../test.sh baseline
```

The test does the following:

1. Checks the license.
2. Detects `prepare` flag and creates a history table and executes `after.sql` script at the end.
3. Dumps schema in YAML format and compares it with expected output.
4. Runs pg_dump to dump the schema in SQL format, then compares it with expected output.

> You can find the details about script types, versioning and script execution order in [Script Versions and Types](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) article.