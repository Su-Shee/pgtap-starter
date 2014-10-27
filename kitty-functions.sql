CREATE ROLE catsitter LOGIN PASSWORD 'supersecure' VALID UNTIL '2014-11-01';

CREATE FUNCTION updated_timestamp () RETURNS trigger AS $updated$
  BEGIN
    NEW.updated := current_timestamp(1);
    RETURN NEW;
  END;
$updated$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION nicer_age(birth date) RETURNS text AS $kitty_age$
  DECLARE kitty_age text;
  BEGIN
    SELECT age(birth) INTO kitty_age;
    -- quick and dirty for illustration - fails if there isn't any "mons" ;)
    RETURN replace(kitty_age, 'mons', 'months');
  END;
$kitty_age$ LANGUAGE 'plpgsql';

CREATE TRIGGER updated BEFORE UPDATE ON traits
    FOR EACH ROW EXECUTE PROCEDURE updated_timestamp ();

