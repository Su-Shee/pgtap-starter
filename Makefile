# pgtap talk schema, data & tests

TESTDIR  = t/
PGUSER   = postgres
DATABASE = kittycats

table:
	psql -U $(PGUSER) -d $(DATABASE) < cats-schema.sql
	psql -U $(PGUSER) -d $(DATABASE) < traits-schema.sql
	psql -U $(PGUSER) -d $(DATABASE) < kitty-functions.sql

data:
	psql -U $(PGUSER) -d $(DATABASE) < cats-data.sql
	psql -U $(PGUSER) -d $(DATABASE) < traits-data.sql

clean:
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop role catsitter;'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop trigger updated on traits;'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop function updated_timestamp();'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop table traits;'
	psql -U $(PGUSER) -d $(DATABASE) -c 'drop table cats;'

test: $(TESTDIR)/*.sql
	pg_prove -U $(PGUSER) -d $(DATABASE) $^ --verbose
