CREATE OR REPLACE function test_sp() RETURNS  varchar AS $$
BEGIN
    -- Hint: The best practice is to put comments, ticket number, version or any information about the code

    -- Here we return a 'first' string and will change it to the 'second' in the next script version
    return 'The First Version of Code';
END;
$$ LANGUAGE plpgsql;
