#1 Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select distinct apellido1,apellido2,nombre from persona PE left join alumno_se_matricula_asignatura AL on PE.id = AL.id_alumno order by apellido1 desc, apellido2 desc, nombre desc;
#2 Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select distinct nombre, apellido1,apellido2, telefono "NO TELEFONO" from persona PE left join alumno_se_matricula_asignatura AL on PE.id = AL.id_alumno where telefono is null;
#3 Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona PE left join alumno_se_matricula_asignatura AL on PE.id = AL.id_alumno where YEAR(fecha_nacimiento) = "1999";
#4 Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select * from persona PE inner join profesor PF on PE.id = PF.id_profesor where telefono is null and right(nif,1) = 'K';
#5 Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura AG where AG.curso = 3 and AG.cuatrimestre = 1 and id_grado = 7;
