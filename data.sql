/* Populate database with sample data. */
 INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (1,'Agumon', '02-03-2020','10.23','true',0);
  INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (2,'Gabumon', '11-15-2018','8','true',2);
  INSERT INTO animals (id,name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES (3,'Pikachu', '1-7-2021','15.04','false',1);
  INSERT INTO animals (id,name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (4,'Devimon', '05-12-2017', '11', 'true', '5');

INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5,'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6,'Plantmon','2021-11-15', 2, true, -5.7);
INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7,'Squirtle','1993-04-02', 3, false, -12.13);
INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8,'Angemon','2005-06-12', 1, true, -45);
INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9,'Boarmon','2005-06-07', 7, true, 20.4);
INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10,'Blossom','1998-10-13', 3, true, 17);
INSERT INTO animals (id,name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11,'Ditto','2022-05-14', 4, true, 22);


-- onwers
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- insert into species
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = (SELECT id from species WHERE name = 'Digimon') WHERE name LIKE '%mon%';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

-- insert into animal table
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name in ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name in ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name in ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name in ('Angemon', 'Boarmon');