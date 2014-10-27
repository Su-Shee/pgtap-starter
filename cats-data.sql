-- psql -U postgres -d kittycats < cats-data.sql

INSERT INTO cats (name, breed, origin, birthday)
  VALUES ('Kitty', 'Burmese', 'TH', '2010-12-06');
INSERT INTO cats (name, breed, origin)
  VALUES ('Missy', 'Chartreux', 'FR');
INSERT INTO cats (name, breed, origin, birthday)
  VALUES ('Sassy', 'Mau', 'EG', '2008-08-04');
INSERT INTO cats (name, breed, origin, birthday) VALUES
  ('Mitzi', 'Norwegian Forest Cat', 'NO', '2011-03-03');

