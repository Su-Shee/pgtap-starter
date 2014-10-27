-- psql -U postgres -d kittycats < traits-schema.sql

CREATE TABLE traits (
  id SERIAL PRIMARY KEY,
  kitty SERIAL REFERENCES cats (id),
  noise TEXT,
  ability TEXT,
  updated TIMESTAMP
);

