-- optional script runs after all migrations committed, and wnt logged into history table
\d rdbm_history
select * from rdbm_history;

-- non failsafe, so any errors here wont affect migration nor execution results
