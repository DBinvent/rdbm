# Sample of using Rumba[rdbm] 


## Usecases:

1. [Baseline](baseline/)
2. [Simple migration](simple/)
3. [Versioned migration](versions/)
4. [Tag and Status](tag/)
5. [StoredProc as Repeatable migration](storedproc/)
6. [Simple ETL](simpleetl/)
7. [ETL: mixes SQL and CSV](etl/)
8. [Create DB](createdb/)
9. [Dry Run](dryrun/)
10. [Log DB as Copy Deploment history journal to another DB](logdb/)

Get a list of all available test cases:
```bash
./test.sh 

```

Every usecase perform migration and YAML & SQL dump to compare with expected result. 


## Run a test case with Docker:
```bash
./test.sh baseline # or any other usecase your prefer to run

```

## Run a test case and keep it open with Postgres client:
```bash
./test.sh baseline psql

```
So, you can check generated tables and history journal.

##Run a test case and keep it open with Bash client:
```bash
./test.sh baseline bash

```
Very useful to play with preconfigured rdbm app 
