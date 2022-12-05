-- V-files are immutable SQL scripts. They're run only once and their checksums are stored in the history table.
-- Let's mix declarative schema definition in YAML files with direct manipulations from SQL scripts.

ALTER TABLE test_schema.test_table
 ADD COLUMN extra character varying(80) not null default uuid_generate_v4();

insert into test_schema.test_table(test) values('first data');
