\echo AFTER migration
select id, source, source_type, version, script_tag, target, catalog, executed_by, ok
from rumba.sql_history where source <> 'baseline';
