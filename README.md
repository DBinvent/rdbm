# Examples of using Schema Guard 

* The Postgresql script tracking tool 

Here you will see a set of scripts that demonstrate usage of Schema Guard [[rdbm]](https://www.dbinvent.com/rdbm/) by [DBinvent](https://www.linkedin.com/company/dbinvent).

The examples show most typical use cases and are written to run in a Docker container. You can also use them as a starting point to adopt Schema Guard into your workflow quickly and without touching Docker at all.

Before we move on to running tests, let's briefly describe the main Schema Guard features.

## About Schema Guard

Schema Guard is a database schema migration tool for PostgreSQL that helps manage, control and deploy database schema changes across various environments and development stages.

It employs the automatic SQL generation and plain-SQL approach in one software. Scripts can be assigned with a version and a certain migration phase, which brings developers true flexibility to perform the necessary action at an exact migration stage.

## Key features
- Creates database and user if needed
- Provides both: schema/table definition and script execution tracking
- Simple ETL: data extraction from snapshots AND data insert after schema migration
- Supports a separate DB connection for history table as a remote copy of a primary one
- Uses native _psql_ client for script execution, built-in support for psql `--single-transaction` flag
- No JVM nor Python required to run
- Lightweight, just about 10MB
- Comes with an apt repository to stay updated
- Transactional changes with rollback OR configurable non-transactional mode
- Dry run on existing databases, _diff_ tool friendly output
- Free personal license

## Use cases

The use cases perform database schema migrations and make some dumps. Then the produced YAML and SQL files are compared with the expected result.

1. [Baseline](examples/baseline/) - Validates the license and performs a self migration.
2. [Create DB](examples/createdb/) - Creates user (role) and database on demand.
3. [Simple migration](examples/simple/) - Simple migration, schema in YAML then a few inserts in plain-SQL script.
4. [Versioned, schema in YAML files](examples/schemas/) - Sample of declarative schema definition in YAML files, version 1 to version 2 migration.
5. [Versioned, schema in SQL scripts](examples/versions/) - Plain-SQL way to migrate database schema.
6. [Stored procure](examples/sp/) - Repeatable scripts execution on every migration, useful for stored procedures and functions.
7. [Mixing SQL with YAML](examples/sql-and-yaml/) - Mixing declarative schema definition in YAML files with plain-SQL scripts, triggers and _before schema generation_ SQL script.
8. Simple examples of **E**xtract-**T**ransform-**L**oad operations: [1](examples/s1etl/), [2](examples/s2etl/), [3](examples/s3etl/)
9. [ETL: mixes SQL and CSV](examples/etl/) - Mixing data sourcing from SQL and CSV files.
10. [Tag and User](examples/tag/) - Tagging migration and run it under a specific user.
11. [Dry run](examples/dryrun/) - Lists the SQL that is generated for upcoming migration, without making actual changes.
12. [Remote history DB](examples/logdb/) - History table in the external database.
13. [URL](examples/url/) - Passing a connection string through --db_url= param rather than providing the configuration file.
14. [ENV](examples/env/) - Using the environment variables to set the configuration params.

## File naming convention

Versioned scripts, schema files and data files for ETL operations follow simple naming rules. You can find more details in the [Script Versions and Types](https://www.dbinvent.com/rdbm/guide/script-versions-and-types) article.

```shell
[Type][Version]__[Script_name].[yaml|sql|csv]
  1       2            3              4
```

1. Type - Single Capital Letter, one of these: `P`,`S`,`V`,`R`,`D` or `A` for 'after'
2. Version - one or more digits divided by _, which further will be replaced with dots. Ex: 1_2 will be 1.2.0
3. Script name - any meaningful name of the script file
4. File type: yaml, sql or csv

## File types and execution order
1. `P` - The _**P**re-deploy_ SQL scripts are executed before the schema is changed from S and V files.
2. `S` - The next _**S**chema_ version in YAML format. Schema Guard computes the changes required and generates SQL commands on the fly. You can mix S and V files. See also D type.
3. `D` - The _**D**ata_ files for ETL operations used in batch with the S-files. See [ETL](examples/etl/) example
4. `V` - Transition to the next schema _**V**ersion_ in plain-SQL. Usually, the most-used file types. You can mix V and S files.
5. `R` - The _**R**epeatable_ and mutable scripts, applied every time the schema is changed. Useful for stored procedures and functions.
6. `A` - _**A**fter_ migration scripts. Run after all the scripts of the same version or at the end of all migrations. Allowed names are after.sql and after_each.sql


## Running the examples

To run the examples, you need the [Docker installed](https://docs.docker.com/get-docker/).

Clone this repository:

```shell
git clone https://github.com/DBinvent/rdbm.git
```

Then cd to rdbm folder:

```shell
cd rdbm
```

Now you are ready to run examples, one-by-one or all at once. To get the list of all available test cases:

```shell
./test.sh
```

### Running a specific example

```shell
./test.sh baseline # or any other name from the list displayed by ./test.sh
```

### Running an example and keeping psql prompt open

If you're interested in examining the resulting schema or history table content, it can be useful to keep the psql prompt after the example is completed.

```shell
./test.sh baseline psql
```

### Running an example and keeping bash prompt open

You can play with preconfigured rdbm application in the launched Docker container.

```shell
./test.sh baseline bash
```

