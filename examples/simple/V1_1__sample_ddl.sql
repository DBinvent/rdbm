--test
-- test --single-transaction=false

insert into test_schema.test_table (test) values (NULL);
insert into test_schema.test_table (test) values ('NULL');
insert into test_schema.test_table (test) values ('third');

select * from test_schema.test_table;