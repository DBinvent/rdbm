-- Versioned scripts, runs as is with checksum
-- Versioned are immutable and usefull to track exact changes to apply on DB
-- Lets mix YAML schema and SQL

ALTER TABLE test_schema.test_table
 ADD COLUMN extra character varying(80) not null default uuid_generate_v4();

insert into test_schema.test_table(test) values('first data');
