-- A-type scripts are executed after the migrations are done. There are two special file names:
-- after.sql and after_each.sql. Run at the end of all migrations or after all scripts of the same version
-- respectively.

\echo AFTER migration
\dt test_schema.test_*
