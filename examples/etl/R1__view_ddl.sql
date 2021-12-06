create OR replace view vw_test_snapshot as
select tt.id, 'copy: '|| tt.test as test, tr.test as ref_test from test_schema.test_table tt
--left outer
join test_schema.test_ref_table tr on tt.tr=tr.id
where tt.id > 1;
