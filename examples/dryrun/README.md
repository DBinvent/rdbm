# Dry run

Lists the SQL that is generated for upcoming migration, without making actual changes. The `dry_run=yes` parameter is set in `test.cfg` file.

> Rumba RDBM accepts configuration parameters from the command-line, configuration file, and environment variables. So, you can set parameters from `test.cfg` in different ways. Please read the [Configuration](https://www.dbinvent.com/rdbm/guide/configuration) article to learn the details.

## Running the test

```shell
../test.sh dryrun
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh dryrun psql
```
