# Sample of using Rumba[rdbm] 

This is a set of scripts demonstrate usage of Rumba[[rdbm]](https://www.dbinvent.com/rdbm/) by DBinvent.

Rumba is a database schema migration tool for PostgreSQL that helps manage, control and deploy database schema changes across various environments and development stages.

It employs the automatic SQL generation and plain-SQL approach in one software. Scripts can be assigned with a version and a certain migration phase, which brings developers true flexibility to perform the action at an exact migration stage. 

Every usecase perform migration and YAML & SQL dump to compare with expected result. 

## Usecases:

1. [Baseline](examples/baseline/)  Test license and perform a self migration.
2. [Create DB](examples/createdb/) Test Create User(role) and Database on demand.
3. [Simple migration](examples/simple/) Simple migration with tracking versioned YAML and SQL script
4. [Versioned YAML schemas migration](examples/schemas/) Multiple YAML scripts with limit by defining target version 
5. [Versioned SQL migration](examples/versions/) Multiple SQL scripts with limit by defining target version 

   comming soon...
 
6. [StoredProc](examples/sp/) Repeatable migration 
7. [Complex](examples/complex/) Mixed YAML Schemas, SQL, Triggers and Pre Deploy SQL
8. [Tag and User](examples/tag/) Add tagging and user info into migration
9. [Simple ETL](examples/simpleetl/) Simple example of Extract (Transform) Load data with the schema migration
10. [ETL: mixes SQL and CSV](examples/etl/) Mixing data sourcing from plain SQL and CSV
11. [Dry Run](examples/dryrun/) Show generated SQL code without real execution
12. [Log DB](examples/logdb/)  Copy Deployment history journal to another DB

Get a list of all available test cases:
```bash
./test.sh 

```


## Run a test case within a Docker container:
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
Very useful to play with preconfigured rdbm app. Try: rdbm help

