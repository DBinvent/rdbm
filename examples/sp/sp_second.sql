CREATE OR REPLACE function test_sp() RETURNS  varchar AS $$
BEGIN
-- this code been updated in the purpose of demonstrate mutability of SQL script
    return 'The Second Version of a Code';
END;
$$ LANGUAGE plpgsql;
