-- R-files are repeatable script, run after the incoming migration makes the changes.
-- They may be used for the data updates.

update test_schema.test_table set test = 'first updated' where id = 1;
