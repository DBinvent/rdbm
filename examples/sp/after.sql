-- A-type scripts are executed after the migrations are done. There are two special file names:
-- after.sql and after_each.sql. Run at the end of all migrations or after all scripts of the same version
-- respectively.

\echo "Expecting only one version in history table"
select source_type, version, source, ok, checksum, times from public.rdbm_history where version<> 'baseline';

select test_sp();

\sf test_sp
