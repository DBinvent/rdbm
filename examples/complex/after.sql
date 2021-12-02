\echo AFTER All migrations
\d test_schema.test_table

select * from test_schema.test_table;

select source_type, version, source, ok from public.rdbm_history order by id;
