CREATE DATABASE clinic;

CREATE TABLE patients (
  id SERIAL NOT NULL,
name VARCHAR(100),
date_of_birth DATE NOT NULL,
PRIMARY KEY(id),
);

CREATE TABLE medical_histories (
  id SERIAL NOT NULL,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(100),
  PRIMARY KEY (id)
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);