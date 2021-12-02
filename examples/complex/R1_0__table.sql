-- Repeatable script, runs after Versioned SQL. Will use for update data

update test_schema.test_table set test = 'first updated' where id = 1;
