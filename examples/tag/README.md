# Tagging migration and running it under a specific user

This test case uses `script_tag` in `test.cfg` to tag the migration in the history table and demonstrates how to run a migration under a specific system user.

## Running the test

```shell
../test.sh tag
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh tag psql
```
