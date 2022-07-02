# Sample of using Rumba[rdbm] 

This is a set of scripts demonstrate usage of Rumba[[rdbm]](https://www.dbinvent.com/rdbm/) by [DBinvent](https://www.linkedin.com/company/dbinvent).

Rumba is a database schema migration tool for PostgreSQL that helps manage, control and deploy database schema changes across various environments and development stages.

It employs the automatic SQL generation and plain-SQL approach in one software. Scripts can be assigned with a version and a certain migration phase, which brings developers true flexibility to perform the action at an exact migration stage. 

## Key features:

 - create database and user if absent
 - use both: schema/table definition and script execution tracking
 - simple ETL for extraction on snapshot AND do load data on migration
 - support separate db connection for history table as a remote copy or primary one
 - use psql client for script execution, include native psql script support with transaction control
 - no JVM nor Python required to run
 - lightweight (just about 10MB) with apt repo to stay updated
 - transactional changes with rollback OR use configurable non-transactional mode
 - dry run and diff with existing DB
 - free personal license


Every usecase perform migration and YAML & SQL dump to compare with expected result. 

## Usecases:

1. [Baseline](examples/baseline/)  Test license and perform a self migration.
2. [Create DB](examples/createdb/) Test Create User(role) and Database on demand.
3. [Simple migration](examples/simple/) Simple migration with tracking versioned YAML and SQL script
4. [Versioned YAML schemas migration](examples/schemas/) Multiple YAML scripts with staged migration 
5. [Versioned SQL migration](examples/versions/) Multiple SQL scripts with staged migration 
6. [StoredProc](examples/sp/) Repeatable migration useful for Stored Procedures or Function 
7. [Complex](examples/complex/) Mixed YAML Schemas, SQL, Triggers and Pre Deploy SQL
8. Simple example of ETL: Extract-Transform-Load: [1](examples/s1etl/), [2](examples/s2etl/), [3](examples/s3etl/) with the schema migration
9. [ETL: mixes SQL and CSV](examples/etl/) Mixing data sourcing from plain SQL and CSV
10. [Tag and User](examples/tag/) Add tagging and user info into migration
11. [Dry Run](examples/dryrun/) Show generated SQL code without real execution
12. [Log DB](examples/logdb/)  Copy Deployment history journal to another DB
13. [URL](examples/url/) Use single param DB_URL for a connection configuration
14. [ENV](examples/env/) Use environment variables override

## File naming convention:

`[Type][Version]__[script_name].[yaml|sql|csv]`
1. Type - Single Capital Letter one of: P,S,V,R,D or 'a' for 'after'
2. Version - one or more digits number divided by _, which will be replaced to dot. Ex: 1_2 will be 1.2.0
3. The script name - any mean-full name of the script file
4. File type: yaml, sql or csv 

## File type execution order:

1. P - The PreDeploy SQL is to be executed before (S)chema YAML.
2. S - The Schema YAML will try to scan an information DB and apply changes required. The 'D' type will be executed there as well -- see bellow.
3. V - The Version SQL is intended to be a major set of files for DB upgrade and will be executed only one time and be stored into a history log table.
4. R - The Re-runnable (mutable) SQL is very useful for handling stored procedure upgrades, and with a '--script_tag' is easily trackable.
The file type 'D' for data in CSV format deployed as a part of S by define the file in YAML. See [ETL](examples/etl/)


See for more [details](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) 


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

