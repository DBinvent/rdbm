CREATE OR REPLACE function test_sp() RETURNS  varchar AS $$
BEGIN
-- the best practice is to put comments the ticket number, version or any information about the code
    return 'The First Version of a Code';
END;
$$ LANGUAGE plpgsql;
