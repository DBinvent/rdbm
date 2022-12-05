-- V-files are immutable SQL scripts. They're run only once and their checksums are stored in the history table.

CREATE SCHEMA test_schema;

CREATE TABLE test_schema.test_table (
    id serial primary key,
    test character varying(250)
);
