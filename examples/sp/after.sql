\echo "Should be only one migration version"
select source_type, version, source, ok, checksum, times from public.rdbm_history where version<> 'baseline';

select test_sp();

\sf test_sp
