-- V-files are immutable SQL scripts. They're run once and their checksums are stored in the history table.

insert into test_schema.test_table(test) values('second data');
