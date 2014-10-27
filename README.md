pgtap-starter
=============

full basic round of pgtap database testing examples for postgres to get you
started.

how to:

* create a database "kittycats"
* install pgtap: http://pgxn.org/dist/pgtap/
* create extension pgtap;
* install pg_prove: cpan(m) TAP::Parser::SourceHandler::pgTAP

* edit Makefile with your dbuser (default "postgres")
* run: make table, make data, make test

documentation about pgtap: http://pgtap.org/

enjoy! I love pgtap! :)
