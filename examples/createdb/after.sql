-- optional script file
\echo "Full support psql is able to show:"
\l
\c
select count(*) as total_migrations from rdbm_history;
