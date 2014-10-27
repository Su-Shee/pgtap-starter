-- pg_prove -U postgres -d kittycats 01-tables.sql --verbose
-- psql -U postgres -d kittycats -Xf 01-tables.sql

BEGIN;
SELECT plan(9);

SELECT tables_are('public', ARRAY['cats', 'traits']);

SELECT has_table('cats');
SELECT has_pk('cats');
SELECT has_index('cats', 'cats_pkey');
SELECT has_check('cats');

SELECT has_table('traits');
SELECT has_pk('traits');
SELECT has_index('traits', 'traits_pkey');
SELECT has_trigger('traits', 'updated');

SELECT * FROM finish();
ROLLBACK;
