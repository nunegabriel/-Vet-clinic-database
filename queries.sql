/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE  '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true'AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals where neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE  weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 OR weight_kg=17.3;

-- Transactions
BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

-- update transaction
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is null;
COMMIT;
SELECT species FROM animals;

-- delete
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE 'date_of_birth'> '2022-1-01';
SAVEPOINT one;
UPDATE animals SET weight_kg = (weight_kg*-1);
ROLLBACK TO SAVEPOINT one;
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals where escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'  GROUP BY species;

-- animals belonging to Melody Pond
SELECT name AS "name of animal",
full_name AS "full name of owner"
FROM animals 
INNER  JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- all animals that are pokemon
SELECT animals.name AS "name of animal",
species.name AS "name of species name"
FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

--List all owners and their animals and those without animals
SELECT owners.full_name AS "full name of owner",
animals.name AS "name of animal"
FROM animals 
FULL OUTER  JOIN owners
ON animals.owner_id = owners.id;

-- COunt of animals per species?
SELECT COUNT(animals.name) AS "Count of Animal", species.name AS "Species"
FROM animals
INNER JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

-- all Digimon owned by Jennifer Orwell.
SELECT owners.full_name AS "full_name of owner",
animals.name AS "name of animal",
species.name AS "species Name"
FROM owners
INNER JOIN animals
ON animals.owner_id = owners.id
INNER JOIN species
ON animals.species_id = species_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name AS "full name of owner",
animals.name AS "name of animal",
animals.escape_attempts AS "number of escapes"
FROM owners
INNER JOIN animals
ON owners.id = animals.owner_id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

-- owns the most animals
SELECT COUNT(*),  owners.full_name 
FROM owners
INNER JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;
