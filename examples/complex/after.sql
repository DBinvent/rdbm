-- A-type scripts are executed after the migrations are done. There are two special file names:
-- after.sql and after_each.sql. Run at the end of all migrations or after all scripts of the same version
-- respectively.

\echo 'after.sql' stript is executed AFTER All incoming migrations
\d test_schema.test_table

select * from test_schema.test_table;

select source_type, version, source, ok from public.rdbm_history order by id;

-- A-type scripts are not tracked in the history table and do not affect the migration success even if they fail.
