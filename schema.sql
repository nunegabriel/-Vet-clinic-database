/* Database schema to keep the structure of entire database. */


CREATE DATABASE vet_clinic;
CREATE TABLE animals(
   id INT PRIMARY KEY NOT NULL,
   name VARCHAR(100),
   date_of_birth DATE,
   escape_attempts INT ,
   neutered BOOLEAN,
   weight_kg decimal
);

-- addind species column
ALTER TABLE animals
ADD COLUMN species VARCHAR(50);


-- new table
CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INTEGER
);

CREATE TABLE species  (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- modify animals
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT CONSTRAINT species_fk REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);


CREATE TABLE vets(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
age INT,
date_of_graduation DATE
);


CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    date_of_visit DATE,
    PRIMARY KEY (vet_id, animal_id)
);
