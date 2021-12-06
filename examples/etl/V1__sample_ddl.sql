-- \echo test_schema.test_table

insert into test_schema.test_ref_table (test) values ('extra_ref');

insert into test_schema.test_table (test, tr) values ('extra', 5);
-- select * from test_schema.test_table;

-- \echo test_schema.test_ref_table
-- select * from test_schema.test_ref_table;
