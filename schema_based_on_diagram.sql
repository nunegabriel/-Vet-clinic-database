CREATE DATABASE clinic;

CREATE TABLE patients (
  id SERIAL NOT NULL,
name VARCHAR(100),
date_of_birth DATE NOT NULL,
PRIMARY KEY(id),
);