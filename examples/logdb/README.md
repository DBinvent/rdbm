# Remote history database

This test case is demonstrating how to set up mirroring migration history table into an external database. The local history table always exists. However, having an external copy may be useful if you need to grant access to migration history only or just make a copy without any additional effort.  

## Running the test

```shell
../test.sh logdb
```

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
../test.sh logdb psql
```
