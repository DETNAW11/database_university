------------------------------------------------------------ PRUEBAS ----------------------------------------------------

-- Profesor de ingenieria

SET SESSION AUTHORIZATION '11001';
SELECT SESSION_USER, CURRENT_USER;

select * from ingenieria.estudiantes_fac;
SELECT * FROM ingenieria.info_profesores;
UPDATE ingenieria.info_profesores SET nom_p = 'Mi nombre' where current_user = id_p::text;
SELECT * FROM ingenieria.lista_estudiantes;
update ingenieria.lista_estudiantes set n1 = 5 where cod_a = 1001 and cod_e = 200001;
select * from ingenieria.listado_facultad_asig;
select * from ingenieria.listado_facultad_notas;
select * from biblioteca.consulta_escribe;
-- Estudiante de ingenieria

SET SESSION AUTHORIZATION '200001';
SELECT SESSION_USER, CURRENT_USER;

select * from ingenieria.notasestud;
SELECT * FROM biblioteca.consulta_escribe;
select * from biblioteca.consultar_prest_est;

-- Administrador

SET SESSION AUTHORIZATION 'postgres';

select * from biblioteca.prestamos_universidad;
select * from ingenieria.listado_facultad_asig;
select * from ingenieria.listado_facultad_notas;

-- Bibliotecario

SET SESSION AUTHORIZATION 'bibliotecau';

select * from biblioteca.ejemplares;
select * from biblioteca.consulta_escribe;
select * from biblioteca.prestamos_universidad;
select * from biblioteca.presta;
update biblioteca.presta set fecha_d = '2014-04-15' where cod_e = 200008 and num_ej = 1 and fecha_p = '2014-04-01';