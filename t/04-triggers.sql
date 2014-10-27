-- pg_prove -U postgres -d kittycats 04-triggers.sql --verbose
-- psql -U postgres -1f 04-columns.sql kittycats

BEGIN;
SELECT plan(5);

SELECT has_function('updated_timestamp');
SELECT function_lang_is('updated_timestamp', 'plpgsql');
SELECT function_returns('updated_timestamp', 'trigger');

SELECT has_trigger('traits', 'updated');
SELECT trigger_is('traits', 'updated', 'updated_timestamp');

SELECT * FROM finish();
ROLLBACK;
