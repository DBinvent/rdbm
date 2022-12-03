-- A-type scripts are executed after the migrations are done. There are two special file names:
-- after.sql and after_each.sql. Run at the end of all migrations or after all scripts of the same version
-- respectively.
\d rumba.sql_history
\echo 'Should show only one line:'
select * from rumba.sql_history;

-- A-type scripts are not tracked in the history table and do not affect the migration success even if they fail.
