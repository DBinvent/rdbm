-- V-files are immutable SQL scripts. They're run once and their checksums are stored in the history table.
-- Usually we use them when we can't use S-files in YAML format.
-- Let's mix declarative schema definition in YAML files with direct manipulations from SQL scripts.

ALTER TABLE test_schema.test_table
 ADD COLUMN extra character varying(80) not null default uuid_generate_v4();

insert into test_schema.test_table(test) values('first data');
