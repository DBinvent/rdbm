-- A-type scripts are executed after the migrations are done. There are two special file names:
-- after.sql and after_each.sql. Run at the end of all migrations or after all scripts of the same version
-- respectively.

\echo AFTER migration
select id, source, source_type, version, script_tag, target, catalog, executed_by, ok
from rumba.sql_history where source <> 'baseline';
