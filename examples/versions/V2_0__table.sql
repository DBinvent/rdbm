CREATE TABLE test_schema.test_ref_table (
    id serial primary key,
    test character varying(20)
);

ALTER TABLE test_schema.test_table
  ADD COLUMN tr int4;

ALTER TABLE test_schema.test_table
  ADD CONSTRAINT fk_test_schema_test_table_test_ref_table
  FOREIGN KEY (tr) REFERENCES test_schema.test_ref_table(id);
