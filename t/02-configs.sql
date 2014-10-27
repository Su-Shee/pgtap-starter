-- pg_prove -U postgres -d kittycats 02-configs.sql --verbose
-- psql -U postgres -d kittycats -Xf 02-configs.sql

BEGIN;
SELECT plan(2);

SELECT has_role('catsitter');
SELECT is(pg_settings.setting, '100') from pg_settings where name = 'max_connections';

SELECT * FROM finish();
ROLLBACK;
