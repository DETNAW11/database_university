-- DROP DATABASE IF EXISTS university;
---------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------- DDL --------------------------------------------------------
------------------ Creación de los esquemas, dblink, tablas (con constraints) ---------------------------------------
---------------------------------------------------------------------------------------------------------------------

-- CREATE DATABASE university;

-- El esquema ingenieria es el general. Se creará un esquema por cada carrera.
-- Debe crear al menos 4 carreras.
CREATE SCHEMA ingenieria;
CREATE SCHEMA "Ingenieria de Sistemas";
CREATE SCHEMA "Ingenieria Mecanica";
CREATE SCHEMA "Ingenieria Electronica";
CREATE SCHEMA "Ingenieria Ambiental";
CREATE SCHEMA "Ingenieria Industrial";
-- La biblioteca se gestiona por aparte, por lo tanto debe crearse como esquema.
CREATE SCHEMA biblioteca;
-- Dado que los estudiantes son por carrera pero el resto de relaciones son transversales, en el esquema ingenieria 
-- deben ir los profesores, carreras, asignaturas y sus relaciones (imparte, inscribe, referencia).
set search_path = ingenieria, public;
-- Aquí crea entonces dichas tablas con sus constraints.

CREATE TABLE ingenieria.profesores (
    id_p BIGINT PRIMARY KEY,
    nom_p VARCHAR(100) NOT NULL,
    dir_p VARCHAR(200),
    tel_p VARCHAR(20),
    profesion VARCHAR(50)
);

CREATE TABLE ingenieria.carreras (
    id_carr BIGINT PRIMARY KEY,
    nom_carr VARCHAR(100) NOT NULL,
    reg_calif VARCHAR(50),
    creditos INT
);

CREATE TABLE ingenieria.asignaturas (
    cod_a SERIAL PRIMARY KEY,
    nom_a VARCHAR(100) NOT NULL,
    int_h INT,
    creditos_a INT
);

CREATE TABLE ingenieria.imparte (
    id_p INT REFERENCES ingenieria.profesores(id_p),
    cod_a INT REFERENCES ingenieria.asignaturas(cod_a),
    grupo VARCHAR(10),
    horario VARCHAR(50),
    PRIMARY KEY (id_p, cod_a, grupo)
);

------------------------------------------------- Estudiantes por carrera -------------------------------------------

set search_path = "Ingenieria de Sistemas", public;

-- Aquí crea la tabla estudiantes con sus constraints.

CREATE TABLE "Ingenieria de Sistemas".estudiantes (
    cod_e SERIAL PRIMARY KEY,
    nom_e VARCHAR(100) NOT NULL,
    dir_e VARCHAR(200),
    tel_e VARCHAR(20),
    fech_nac DATE,
    id_carr INT REFERENCES ingenieria.carreras(id_carr)
);

set search_path = "Ingenieria Mecanica", public;

-- Aquí crea la tabla estudiantes con sus constraints.

CREATE TABLE "Ingenieria Mecanica".estudiantes (
    cod_e SERIAL PRIMARY KEY,
    nom_e VARCHAR(100) NOT NULL,
    dir_e VARCHAR(200),
    tel_e VARCHAR(20),
    fech_nac DATE,
    id_carr INT REFERENCES ingenieria.carreras(id_carr)
);
set search_path = "Ingenieria Electronica", public;

-- Aquí crea la tabla estudiantes con sus constraints.

CREATE TABLE "Ingenieria Electronica".estudiantes (
    cod_e SERIAL PRIMARY KEY,
    nom_e VARCHAR(100) NOT NULL,
    dir_e VARCHAR(200),
    tel_e VARCHAR(20),
    fech_nac DATE,
    id_carr INT REFERENCES ingenieria.carreras(id_carr)
);

set search_path = "Ingenieria Ambiental", public;

-- Aquí crea la tabla estudiantes con sus constraints.

CREATE TABLE "Ingenieria Ambiental".estudiantes (
    cod_e SERIAL PRIMARY KEY,
    nom_e VARCHAR(100) NOT NULL,
    dir_e VARCHAR(200),
    tel_e VARCHAR(20),
    fech_nac DATE,
    id_carr INT REFERENCES ingenieria.carreras(id_carr)
);

set search_path = "Ingenieria Industrial", public;

-- Aquí crea la tabla estudiantes con sus constraints.

CREATE TABLE "Ingenieria Industrial".estudiantes (
    cod_e SERIAL PRIMARY KEY,
    nom_e VARCHAR(100) NOT NULL,
    dir_e VARCHAR(200),
    tel_e VARCHAR(20),
    fech_nac DATE,
    id_carr INT REFERENCES ingenieria.carreras(id_carr)
);

-- aquí se crea la relación inscribe ya que necesita que primero esten creadas las tablas de los estudiantes ya que cod_e
-- usa de referncia el cod_e de esas tablas para su foreign key. 
set search_path = ingenieria, public;

CREATE TABLE ingenieria.inscribe (
    cod_e INT,
    cod_a INT REFERENCES ingenieria.asignaturas(cod_a) ON UPDATE CASCADE ON DELETE CASCADE,
    id_p INT REFERENCES ingenieria.profesores(id_p) ON UPDATE CASCADE ON DELETE CASCADE,
    grupo VARCHAR(10),
    n1 FLOAT,
    n2 FLOAT,
    n3 FLOAT,
    PRIMARY KEY (cod_e, cod_a, id_p, grupo),
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria de Sistemas".estudiantes(cod_e) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Mecanica".estudiantes(cod_e) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Electronica".estudiantes(cod_e) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Ambiental".estudiantes(cod_e) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Industrial".estudiantes(cod_e) ON UPDATE CASCADE ON DELETE CASCADE
);
-------------------------------------------------------- Biblioteca -------------------------------------------------

set search_path = biblioteca, public;

-- Aquí crea las tablas asociadas a la parte de la biblioteca (libros, autores, ejemplares, escribre, presta).

CREATE TABLE biblioteca.libros (
    isbn VARCHAR(20) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    edicion VARCHAR(50),
    editorial VARCHAR(100)
);

CREATE TABLE biblioteca.autores (
    id_a SERIAL PRIMARY KEY,
    nom_autor VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE biblioteca.ejemplares (
    isbn VARCHAR(20) REFERENCES biblioteca.libros(isbn),
    num_ej INT,
    PRIMARY KEY (isbn, num_ej)
);

CREATE TABLE biblioteca.escribe (
    isbn VARCHAR(20) REFERENCES biblioteca.libros(isbn),
    id_a INT REFERENCES biblioteca.autores(id_a),
    PRIMARY KEY (isbn, id_a)
);

CREATE TABLE biblioteca.presta (
    cod_e INT,
    isbn VARCHAR(20) REFERENCES biblioteca.libros(isbn),
    num_ej INT,
    fecha_p DATE,
    fecha_d DATE,
    PRIMARY KEY (cod_e, isbn, num_ej, fecha_p),
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria de Sistemas".estudiantes(cod_e),
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Mecanica".estudiantes(cod_e),
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Electronica".estudiantes(cod_e),
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Ambiental".estudiantes(cod_e),
    FOREIGN KEY (cod_e) REFERENCES "Ingenieria Industrial".estudiantes(cod_e)
);

-- aquí se crea la relación referencia ya que necesita que primero este creada las tabla libros ya que isbn
-- usa de referncia el isbn de esa tabla para su foreign key. 
set search_path = ingenieria, public;

CREATE TABLE ingenieria.referencia (
    cod_a INT REFERENCES ingenieria.asignaturas(cod_a),
    isbn VARCHAR(20) REFERENCES biblioteca.libros(isbn),
    PRIMARY KEY (cod_a, isbn)
);

---------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------- VISTAS -----------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

-- Una vista es una tabla virtual que no almacena datos por sí misma, sino que se basa en el resultado de una consulta SQL
-- La sintaxis básica para crear una vista es la siguiente:

-- CREATE VIEW nombre_vista AS consulta;

-- Donde "consulta" es la query SQL que se va a ejecutar cuando se acceda a la vista.

-- Ejemplo:

/*
CREATE VIEW vista_empleados AS 
SELECT id_empleado, nombre, puesto 
FROM empleados 
WHERE salario > 2000;
*/

-- Una vez creada la vista, se puede acceder a ella desde cualquier otro lugar de la base de datos.

-- SELECT * FROM vista_empleados;

-- Para nuestro proyecto:

set search_path = ingenieria, public;

-- Vista que permite consultar la información del profesor
create view info_profesores as 
select *
from profesores
where id_p::text=current_user;
-- Aquí id_p::text=current_user compara si el valor de la columna id_p (convertido a texto) es igual 
-- al nombre del usuario actualmente conectado. Si es así, la fila correspondiente se incluirá en la vista info_profesores.

-- Vista para estudiantes_fac (incluye todos los estudiantes de todas las carreras)
CREATE VIEW estudiantes_fac AS
SELECT e.cod_e, e.nom_e, e.id_carr, c.nom_carr
FROM "Ingenieria de Sistemas".Estudiantes e
JOIN ingenieria.carreras c ON e.id_carr = c.id_carr
UNION
SELECT e.cod_e, e.nom_e, e.id_carr, c.nom_carr
FROM "Ingenieria Mecanica".Estudiantes e
JOIN ingenieria.carreras c ON e.id_carr = c.id_carr
UNION
SELECT e.cod_e, e.nom_e, e.id_carr, c.nom_carr
FROM "Ingenieria Electronica".Estudiantes e
JOIN ingenieria.carreras c ON e.id_carr = c.id_carr
UNION
SELECT e.cod_e, e.nom_e, e.id_carr, c.nom_carr
FROM "Ingenieria Ambiental".Estudiantes e
JOIN ingenieria.carreras c ON e.id_carr = c.id_carr
UNION
SELECT e.cod_e, e.nom_e, e.id_carr, c.nom_carr
FROM "Ingenieria Industrial".Estudiantes e
JOIN ingenieria.carreras c ON e.id_carr = c.id_carr;

-- Vista que permite consultar la lista de estudiantes de sus cursos (para el profesor)
create view lista_estudiantes as
select cod_a, nom_a, grupo, cod_e, nom_e, n1, n2, n3, 
(COALESCE(n1,0)*.35+COALESCE(n2,0)*.35+COALESCE(n3,0)*.3)::real as definitiva
from ingenieria.estudiantes_fac natural join ingenieria.inscribe natural join ingenieria.asignaturas
where id_p::TEXT = current_user
order by cod_a, grupo, cod_e;
-- Aquí la función COALESCE() se usa para sustituir NULL por un 0.
-- Nótese que estudiantes_fac es una vista que reune a todos los estudiantes de la facultad de ingeniería.

-- Vista para notasEstud (para estudiantes)
CREATE OR REPLACE VIEW notasEstud AS
SELECT cod_a, nom_a, grupo, cod_e, nom_e, n1, n2, n3,
    (COALESCE(n1, 0) * 0.35 + COALESCE(n2, 0) * 0.35 + COALESCE(n3, 0) * 0.3)::REAL AS definitiva
FROM ingenieria.inscribe natural join ingenieria.estudiantes_fac natural join ingenieria.asignaturas
where cod_e::text=current_user;
-------------------------------------------------------- Biblioteca -------------------------------------------------

set search_path = biblioteca, public;

-- Vista para consultar la tabla escribe en la facultad de ingeniería
CREATE VIEW consulta_escribe AS
SELECT * from autores natural join libros natural join escribe
ORDER BY id_a,isbn;

CREATE OR REPLACE VIEW consultar_prest_est AS
SELECT isbn, num_ej, titulo, fecha_p, fecha_d
FROM ingenieria.estudiantes_fac
NATURAL JOIN biblioteca.presta
NATURAL JOIN biblioteca.libros
WHERE cod_e::TEXT = current_user
GROUP BY isbn, num_ej, titulo, fecha_p, fecha_d;

---------------------------------------- Para usuario Admin (User postgres) -----------------------------------------

-- Estas vistas las definimos para el usuario Admin de la base de datos en general.
set search_path = ingenieria, public;

-- Vista para la lista de asignaturas con estudiantes
CREATE VIEW listado_facultad_asig AS
SELECT cod_a, nom_a, grupo, cod_e, nom_e FROM ingenieria.estudiantes_fac natural join ingenieria.inscribe natural join ingenieria.asignaturas
ORDER BY cod_a,nom_a,grupo;

CREATE VIEW listado_facultad_notas AS
SELECT cod_a, nom_a, grupo, cod_e, nom_e, n1, n2, n3, (COALESCE(n1, 0) * 0.35 + COALESCE(n2, 0) * 0.35 + COALESCE(n3, 0) * 0.3)::REAL AS definitiva
FROM listado_facultad_asig lf
NATURAL JOIN ingenieria.inscribe i
WHERE lf.cod_a = i.cod_a AND lf.cod_e = i.cod_e 
ORDER BY cod_a, nom_a, grupo;

set search_path = biblioteca, public;

CREATE OR REPLACE VIEW prestamos_universidad AS
SELECT nom_e AS nombre_estudiante, titulo, fecha_p, fecha_d
FROM ingenieria.estudiantes_fac
NATURAL JOIN biblioteca.presta
NATURAL JOIN biblioteca.libros;

---------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- CARGA DE DATOS ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

--profesores, carreras, asignaturas y sus relaciones (imparte, inscribe, referencia)
set search_path = ingenieria, public;

COPY ingenieria.profesores
FROM 'C:\Users\Public\Profesores.csv' csv DELIMITER ';' HEADER;

COPY ingenieria.carreras
FROM 'C:\Users\Public\Carreras.csv' csv DELIMITER ';' HEADER;

COPY ingenieria.asignaturas
FROM 'C:\Users\Public\Asignaturas.csv' csv DELIMITER ';' HEADER;

COPY ingenieria.imparte
FROM 'C:\Users\Public\Imparte.csv' csv DELIMITER ';' HEADER;

set search_path = biblioteca, public;

COPY biblioteca.libros
FROM 'C:\Users\Public\Libros.csv' csv DELIMITER ';' HEADER;

COPY ingenieria.referencia
FROM 'C:\Users\Public\Referencia.csv' csv DELIMITER ';' HEADER;
-------------------------------------------------------- Por carrera ------------------------------------------------

set search_path = "Ingenieria de Sistemas", public;
COPY "Ingenieria de Sistemas".Estudiantes
FROM 'C:\Users\Public\Ingenieria\Sistemas\Estudiantes.csv' csv DELIMITER ';' HEADER;

set search_path = "Ingenieria Mecanica", public;
COPY "Ingenieria Mecanica".Estudiantes
FROM 'C:\Users\Public\Ingenieria\Mecanica\Estudiantes.csv' csv DELIMITER ';' HEADER;

set search_path = "Ingenieria Electronica", public;
COPY "Ingenieria Electronica".Estudiantes
FROM 'C:\Users\Public\Ingenieria\Electronica\Estudiantes.csv' csv DELIMITER ';' HEADER;

set search_path = "Ingenieria Ambiental", public;
COPY "Ingenieria Ambiental".Estudiantes
FROM 'C:\Users\Public\Ingenieria\Ambiental\Estudiantes.csv' csv DELIMITER ';' HEADER;

set search_path = "Ingenieria Industrial", public;
COPY "Ingenieria Industrial".Estudiantes
FROM 'C:\Users\Public\Ingenieria\Industrial\Estudiantes.csv' csv DELIMITER ';' HEADER;

set search_path = ingenieria, public;

CREATE TABLE public.all_students (
    cod_e INT PRIMARY KEY,
    nom_e VARCHAR(100),
    dir_e VARCHAR(200),
    tel_e VARCHAR(15),
    fech_nac DATE,
    id_carr INT
);

-- Insertar los datos de las diferentes carreras en la tabla all_students
INSERT INTO public.all_students (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr)
SELECT cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr FROM "Ingenieria de Sistemas".estudiantes
UNION ALL
SELECT cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr FROM "Ingenieria Mecanica".estudiantes
UNION ALL
SELECT cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr FROM "Ingenieria Electronica".estudiantes
UNION ALL
SELECT cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr FROM "Ingenieria Ambiental".estudiantes
UNION ALL
SELECT cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr FROM "Ingenieria Industrial".estudiantes;


ALTER TABLE ingenieria.inscribe
DROP CONSTRAINT inscribe_cod_e_fkey;
ALTER TABLE ingenieria.inscribe
DROP CONSTRAINT inscribe_cod_e_fkey1;
ALTER TABLE ingenieria.inscribe
DROP CONSTRAINT inscribe_cod_e_fkey2;
ALTER TABLE ingenieria.inscribe
DROP CONSTRAINT inscribe_cod_e_fkey3;
ALTER TABLE ingenieria.inscribe
DROP CONSTRAINT inscribe_cod_e_fkey4;

-- Agregar la nueva clave foránea
ALTER TABLE ingenieria.inscribe
ADD CONSTRAINT inscribe_cod_e_fkey FOREIGN KEY (cod_e)
REFERENCES public.all_students(cod_e)ON UPDATE CASCADE ON DELETE CASCADE;

COPY ingenieria.inscribe
FROM 'C:\Users\Public\Inscribe.csv' csv DELIMITER ';' HEADER;
-------------------------------------------------------- Biblioteca --------------------------------------------------------
set search_path = biblioteca, public;

COPY biblioteca.autores
FROM 'C:\Users\Public\Autores.csv' csv DELIMITER ';' HEADER;

COPY biblioteca.ejemplares
FROM 'C:\Users\Public\Ejemplares.csv' csv DELIMITER ';' HEADER;

COPY biblioteca.escribe
FROM 'C:\Users\Public\Escribe.csv' csv DELIMITER ';' HEADER;

ALTER TABLE biblioteca.presta
DROP CONSTRAINT presta_cod_e_fkey;
ALTER TABLE biblioteca.presta
DROP CONSTRAINT presta_cod_e_fkey1;
ALTER TABLE biblioteca.presta
DROP CONSTRAINT presta_cod_e_fkey2;
ALTER TABLE biblioteca.presta
DROP CONSTRAINT presta_cod_e_fkey3;
ALTER TABLE biblioteca.presta
DROP CONSTRAINT presta_cod_e_fkey4;

-- Agregar la nueva clave foránea
ALTER TABLE biblioteca.presta
ADD CONSTRAINT presta_cod_e_fkey FOREIGN KEY (cod_e)
REFERENCES public.all_students(cod_e) ON UPDATE CASCADE ON DELETE CASCADE;

COPY biblioteca.presta
FROM 'C:\Users\Public\Presta.csv' csv DELIMITER ';' HEADER;
---------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------- ROLES ------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

set search_path = ingenieria, public;

-- Rol estudiantes
-- Verificar y crear rol estudiantesIng
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE rolname = 'estudiantesing') THEN
      CREATE ROLE estudiantesIng;
   END IF;
END
$$;
grant usage on schema ingenieria to estudiantesIng;
grant select on ingenieria.notasEstud to estudiantesIng; -- notasEstud es una vista

GRANT SELECT ON biblioteca.consultar_prest_est TO estudiantesIng;
GRANT SELECT ON biblioteca.consulta_escribe TO estudiantesIng;

-- Rol profesores
-- Verificar y crear rol profesoresIng
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE rolname = 'profesoresing') THEN
      CREATE ROLE profesoresIng;
   END IF;
END
$$;
grant usage on schema ingenieria to profesoresIng; 
GRANT SELECT ON ALL TABLES IN SCHEMA ingenieria TO profesoresIng;
GRANT SELECT, UPDATE (n1, n2, n3)ON ingenieria.lista_estudiantes TO profesoresIng;
GRANT SELECT, UPDATE (n1, n2, n3)ON ingenieria.inscribe TO profesoresIng;
GRANT SELECT ON biblioteca.consulta_escribe TO profesoresIng;
grant select, update (profesion, nom_p, dir_p, tel_p) on ingenieria.info_profesores to profesoresIng; -- infoProfesores es una vista


-------------------------------------------------------- Biblioteca -------------------------------------------------
set search_path = biblioteca, public;
-- Verificar y crear usuario bibliotecau
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE rolname = 'bibliotecau') THEN
      CREATE USER bibliotecau WITH PASSWORD 'bibliotecau';
   END IF;
END
$$;
grant usage on schema biblioteca to bibliotecau;
grant usage on schema ingenieria to bibliotecau;		  

GRANT SELECT ON ingenieria.estudiantes_fac TO bibliotecau;
GRANT SELECT ON biblioteca.presta TO bibliotecau;

GRANT USAGE ON SCHEMA biblioteca to profesoresIng;
GRANT SELECT ON biblioteca.autores TO profesoresIng;
GRANT SELECT ON biblioteca.libros TO profesoresIng;

GRANT USAGE ON SCHEMA biblioteca to estudiantesIng;
GRANT SELECT ON biblioteca.autores TO estudiantesIng;
GRANT INSERT, UPDATE, DELETE, SELECT ON biblioteca.ejemplares TO bibliotecau;
GRANT INSERT, UPDATE, DELETE, SELECT ON biblioteca.consulta_escribe TO bibliotecau;
GRANT INSERT, UPDATE, DELETE, SELECT ON biblioteca.prestamos_universidad TO bibliotecau;
GRANT INSERT, UPDATE, DELETE, SELECT ON biblioteca.libros TO bibliotecau;
GRANT INSERT, UPDATE, DELETE, SELECT ON biblioteca.autores TO bibliotecau;
GRANT INSERT, UPDATE, DELETE, SELECT ON biblioteca.presta TO bibliotecau;

-------------------------------------------------------- Decano -------------------------------------------------
grant usage on schema biblioteca to postgres;
grant usage on schema ingenieria to postgres;
GRANT SELECT ON ingenieria.listado_facultad_asig TO postgres;
GRANT SELECT ON ingenieria.listado_facultad_notas TO postgres;
GRANT SELECT ON biblioteca.prestamos_universidad TO postgres;
---------------------------------------------------------------------------------------------------------------------
------------------------------------------ TRIGGERS Y PROCEDIMIENTOS ------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

set search_path = ingenieria, public;

-- Funcion para crear los usuarios de estudiantes
CREATE OR REPLACE FUNCTION crear_usuarios() RETURNS void AS
$BODY$
DECLARE f ingenieria.estudiantes_fac%rowtype;
DECLARE r ingenieria.profesores%rowtype;
BEGIN
	FOR f IN SELECT * FROM ingenieria.estudiantes_fac
	LOOP
		if (f.cod_e::text not in (select usename from pg_user)) then
			execute 'create user "'||f.cod_e||'" with password '||''''||f.cod_e||'''';
			execute 'grant estudiantesIng to "'||f.cod_e||'"'; 
		end if;
	END LOOP;
	FOR r IN SELECT * FROM ingenieria.profesores
	LOOP
		if (r.id_p::text not in (select usename from pg_user)) then
			execute 'create user "'||r.id_p||'" with password '||''''||r.id_p||'''';
			execute 'grant profesoresIng to "'||r.id_p||'"'; 
		end if;
	END LOOP;
RETURN;
END
$BODY$
LANGUAGE 'plpgsql' ;

-- Funcion que permite al profesor actualizar unicamente las notas de sus estudiantes 
create or replace function update_est() returns trigger as $update_est$
declare
begin
  update ingenieria.inscribe set 
  n1 = NEW.n1, n2 = NEW.n2, n3 = NEW.n3 
  where cod_e = OLD.cod_e and cod_a = OLD.cod_a and cod_e in (select cod_e from ingenieria.lista_estudiantes where id_p::text = current_user);
  RETURN NEW;
end;
$update_est$
language plpgsql;

-- Trigger asociado al update sobre inscribe
create trigger update_est_trg
instead of update on lista_estudiantes
for each row execute procedure update_est();
								 
-- Validacion insert en Inscribe
CREATE OR REPLACE FUNCTION insert_inscribe() RETURNS
TRIGGER AS $insert_inscribe$
BEGIN
	IF (new.cod_e in (select cod_e from ingenieria.estudiantes_fac)) THEN
		RETURN NEW;
	ELSE 
		RETURN NULL;
	END IF;
END;
$insert_inscribe$ LANGUAGE plpgsql;

-- Trigger asociado al insert en la tabla inscribe
CREATE TRIGGER insert_inscribe_trg BEFORE
UPDATE OR INSERT
ON inscribe FOR EACH row
EXECUTE PROCEDURE insert_inscribe();
		
--*************************************************--
					  
-- Ejecutar
set search_path = ingenieria, public;
select crear_usuarios();


SELECT usename FROM pg_user;

SELECT
    pg_roles.rolname AS role_name,
    pg_user.usename AS grantee
FROM
    pg_roles
JOIN
    pg_auth_members ON pg_roles.oid = pg_auth_members.roleid
JOIN
    pg_user ON pg_auth_members.member = pg_user.usesysid
WHERE
    pg_roles.rolname IN ('estudiantesing', 'profesoresing');

SELECT
    pg_user.usename,
    pg_roles.rolname
FROM
    pg_user
JOIN
    pg_auth_members ON pg_user.usesysid = pg_auth_members.member
JOIN
    pg_roles ON pg_auth_members.roleid = pg_roles.oid
WHERE
    pg_user.usename IN (
        SELECT cod_e::text FROM ingenieria.estudiantes_fac
        UNION
        SELECT id_p::text FROM ingenieria.profesores
    );

-- select * from ingenieria.profesores;
-- select * from ingenieria.estudiantes_fac;

-- psql -U "cambiar por el usuario a conectarse" -d university -h localhost


