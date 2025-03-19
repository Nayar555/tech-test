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

CREATE TABLE employee_hobby (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- Limpiar tabla con DELETE o se puede agregar un IF NOT EXISTS
-- DELETE FROM employee;

CREATE TABLE employee_hobby_assignment (
    employee_id INT NOT NULL,
    hobby_id INT NOT NULL,
    PRIMARY KEY (employee_id, hobby_id),
    FOREIGN KEY (employee_id) REFERENCES employee (id),
    FOREIGN KEY (hobby_id) REFERENCES employee_hobby (id)
);

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

-- Insertar hobbies
INSERT INTO employee_hobby (name, description) VALUES
('Lectura', 'Libros, artículos y material educativo'),
('Deportes', 'Actividades físicas y ejercicio'),
('Música', 'Tocar instrumentos o escuchar música');

-- Asignar hobbies a empleados
INSERT INTO employee_hobby_assignment (employee_id, hobby_id) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 1), (3, 3),
(4, 1), (4, 2);

-- Añadir jefe a empleados
ALTER TABLE employee
ADD COLUMN boss_id INT NOT NULL,
ADD CONSTRAINT fk_boss
    FOREIGN KEY (boss_id)
    REFERENCES employee (id)
    ON DELETE RESTRICT;

-- Asignar jefes a empleados
UPDATE employee
SET boss_id = 1
WHERE id IN (2, 4);

UPDATE employee
SET boss_id = 2
WHERE id = 3;