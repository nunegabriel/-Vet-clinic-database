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

CREATE TABLE invoices (
    id SERIAL NOT NULL,
    total_amount decimal,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments(
    id SERIAL NOT NULL,
    PRIMARY KEY (id),
    type VARCHAR(300),
    name VARCHAR(300)
);


CREATE TABLE invoice_items (
    id SERIAL NOT NULL,
    PRIMARY KEY (id),
    unit_price decimal,
    quantity int,
    total_price decimal,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);

