/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE  '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true'AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg >10.5;
SELECT * FROM animals where neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE  weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 OR weight_kg=17.3;