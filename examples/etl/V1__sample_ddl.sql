-- V-files are immutable SQL scripts. They're run only once and their checksums are stored in the history table.
-- Usually we use them when we can't use S-files in YAML format.

-- \echo test_schema.test_table

insert into test_schema.test_ref_table (test) values ('extra_ref');

insert into test_schema.test_table (test, tr) values ('extra', 5);
-- select * from test_schema.test_table;

-- \echo test_schema.test_ref_table
-- select * from test_schema.test_ref_table;
