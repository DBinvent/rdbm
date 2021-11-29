-- optional script runs after all migrations committed, and wnt logged into history table
\d rumba.sql_history
\echo 'Should show only one line:'
select * from rumba.sql_history;

-- non failsafe, so any errors here wont affect migration nor execution results
