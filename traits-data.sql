-- psql -U postgres -d tapcats < traits-data.sql

INSERT INTO traits (kitty, noise, ability)
  VALUES (1, 'quiet', 'nothing special');
INSERT INTO traits (kitty, noise, ability)
  VALUES (2, 'very quiet', 'looks nice');
INSERT INTO traits (kitty, noise, ability)
  VALUES (3, 'talkative', 'fetches stuff');
INSERT INTO traits (kitty, noise, ability)
  VALUES (4, 'yells at you', 'survives cold');

