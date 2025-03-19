-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE employee_department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- CREATE TABLE employee_hobby (
-- );

-- Añadir relación empleado-departamento
ALTER TABLE employee
ADD COLUMN department_id INTEGER NOT NULL,
ADD CONSTRAINT fk_department
    FOREIGN KEY (department_id)
    REFERENCES employee_department(id);

-- Insertar departamentos
INSERT INTO employee_department (name, description) VALUES
('Ventas', 'Equipo de ventas y relaciones comerciales'),
('TI', 'Departamento de Tecnologías de la Información'),
('RH', 'Recursos Humanos y contrataciones'),
('Marketing', 'Publicidad y estrategias de mercado'),
('Logística', 'Distribución y gestión de inventarios'),
('Gerencia', 'Administración general de la empresa');

-- Insertar empleados
INSERT INTO employee (first_name, last_name, department_id) VALUES
('Juan', 'Pérez', 2),
('María', 'González', 1),
('Pedro', 'López', 2),
('Laura', 'Martínez', 4);