# pgtap talk schema, data & tests

TESTDIR  = t/
PGUSER   = postgres
DATABASE = kittycats

table:
	psql -U $(PGUSER) -1f cats-schema.sql $(DATABASE)
	psql -U $(PGUSER) -1f traits-schema.sql $(DATABASE)
	psql -U $(PGUSER) -1f kitty-functions.sql $(DATABASE)

data:
	psql -U $(PGUSER) -1f cats-data.sql $(DATABASE)
	psql -U $(PGUSER) -1f traits-data.sql $(DATABASE)

clean:
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop trigger updated on traits;'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop function updated_timestamp();'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop role catsitter;'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop table traits;'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop table cats;'

test: $(TESTDIR)/*.sql
	pg_prove -U $(PGUSER) -d $(DATABASE) $^ --verbose
