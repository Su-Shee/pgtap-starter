-- psql -U postgres -1f traits-schema.sql kittycats

CREATE TABLE traits (
  id SERIAL PRIMARY KEY,
  kitty SERIAL REFERENCES cats (id),
  noise TEXT,
  ability TEXT,
  updated TIMESTAMP
);

