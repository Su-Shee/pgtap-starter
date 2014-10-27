-- psql -U postgres -d kittycats < cats-schema.sql

CREATE TABLE cats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  breed TEXT NOT NULL,
  origin TEXT NOT NULL CHECK (LENGTH(origin) = 2),
  birthday DATE NOT NULL DEFAULT current_date
);

