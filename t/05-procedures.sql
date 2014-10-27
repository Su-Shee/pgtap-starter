-- pg_prove -U postgres -d kittycats 05-procedures.sql --verbose
-- psql -U postgres -1f 05-procedures.sql kittycats

BEGIN;
SELECT plan(9);

SELECT tables_are('public', ARRAY['cats', 'traits']);

SELECT has_table('cats');
SELECT has_pk('cats');
BEGIN;
SELECT plan(4);

SELECT has_function('nicer_age');
SELECT matches(nicer_age(cats.birthday), 'months') FROM cats WHERE name = 'Kitty';
SELECT isa_ok(nicer_age('2014-10-09'), 'text', 'Function nicer_age returns text.');
SELECT function_returns('nicer_age', 'text');

SELECT * FROM finish();
ROLLBACK;
