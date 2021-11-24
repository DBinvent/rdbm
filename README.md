# Sample of using Rumba[rdbm] 

This is a set of scripts demonstrate usage of Rumba[[rdbm]](https://www.dbinvent.com/rdbm/) by DBinvent.

Rumba is a database schema migration tool for PostgreSQL that helps manage, control and deploy database schema changes across various environments and development stages.

It employs the automatic SQL generation and plain-SQL approach in one software. Scripts can be assigned with a version and a certain migration phase, which brings developers true flexibility to perform the action at an exact migration stage. 

Every usecase perform migration and YAML & SQL dump to compare with expected result. 

## Usecases:

1. [Baseline](examples/baseline/)  Test license and perform a self migration.

comming soon...

3. [Simple migration](examples/simple/) 
4. [Versioned migration](examples/versions/)
5. [Tag and Status](examples/tag/)
6. [StoredProc as Repeatable migration](examples/storedproc/)
7. [Simple ETL](examples/simpleetl/)
8. [ETL: mixes SQL and CSV](examples/etl/)
9. [Create DB](examples/createdb/)
10. [Dry Run](examples/dryrun/)
11. [Log DB as Copy Deploment history journal to another DB](examples/logdb/)

Get a list of all available test cases:
```bash
./test.sh 

```


## Run a test case with Docker:
```bash
./test.sh baseline # or any other usecase your prefer to run

```

## Run a test case and keep it open with Postgres client:
```bash
./test.sh baseline psql

```
So, you can check generated tables and history journal.

## Run a test case and keep it open with Bash client:
```bash
./test.sh baseline bash

```
Very useful to play with preconfigured rdbm app 
