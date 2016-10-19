DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  -- id is a serial4 which will auto increment
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);
CREATE TABLE albums(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  -- artist_id links as a foreign key to a id and is a int4 to match the serial4 type
  artist_id INT4 REFERENCES artists(id)
);
