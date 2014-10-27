-- pg_prove -U postgres -d kittycats 03-columns.sql --verbose
-- psql -U postgres -1f 03-columns.sql kittycats

BEGIN;
SELECT plan(9);

SELECT tables_are('public', ARRAY['cats', 'traits']);

SELECT has_table('cats');
SELECT has_pk('cats');
BEGIN;

SELECT plan(30);

SELECT columns_are('cats', ARRAY['id', 'name', 'breed', 'origin', 'birthday']);

SELECT has_column('cats', 'id');
SELECT col_is_pk('cats', 'id');
SELECT col_not_null('cats', 'id');
SELECT col_type_is('cats', 'id', 'integer');
SELECT has_sequence('public', 'cats_id_seq', 'Column type serial therefore has a sequence');

SELECT has_column('cats', 'origin');
SELECT col_type_is('cats', 'origin', 'text');
SELECT col_not_null('cats', 'origin');
SELECT col_has_check('cats', 'origin');

SELECT has_column('cats', 'name');
SELECT col_type_is('cats', 'name', 'text');

SELECT col_has_default('cats', 'birthday');
SELECT col_default_is('cats', 'birthday', 'now()');

SELECT columns_are('traits', ARRAY['id', 'noise', 'kitty', 'ability', 'updated']);

SELECT has_pk('traits');
SELECT has_column('traits', 'id');
SELECT col_is_pk('traits', 'id');
SELECT col_not_null('traits', 'id');
SELECT col_type_is('traits', 'id', 'integer');
SELECT has_sequence('public', 'traits_id_seq', 'Column id is type serial and has a sequence');

SELECT has_column('traits', 'noise');
SELECT col_type_is('traits', 'noise', 'text');

SELECT has_column('traits', 'ability');
SELECT col_type_is('traits', 'ability', 'text');

SELECT has_column('traits', 'updated');
SELECT col_type_is('traits', 'updated', 'timestamp without time zone');

SELECT has_fk('traits');
SELECT col_is_fk('traits', 'kitty');
SELECT fk_ok('traits', 'kitty', 'cats', 'id');

SELECT * FROM finish();
ROLLBACK;
