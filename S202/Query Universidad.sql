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
#6 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select apellido1, apellido2, PE.nombre, DEP.nombre from persona PE inner join profesor PR on PE.id = PR.id_profesor left join departamento DEP on PR.id_departamento = DEP.id order by PE.id; 
#7 Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select ASS.nombre, anyo_inicio, anyo_fin from persona PE inner join alumno_se_matricula_asignatura AL on AL.id_alumno = PE.id inner join asignatura ASS on ASS.id = AL.id_asignatura inner join curso_escolar CE on AL.id_curso_escolar = CE.id  where PE.nif = "26902806M"; 
#8 Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
select distinct DEP.nombre from departamento DEP inner join profesor PR on PR.id_departamento = DEP.id inner join asignatura ASS on ASS.id_profesor = PR.id_profesor inner join grado GR on GR.id=ASS.id_grado where GR.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
#9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
select distinct * from persona PE inner join alumno_se_matricula_asignatura AL on PE.id = AL.id_alumno inner join curso_escolar CE on AL.id_curso_escolar = CE.id where anyo_inicio = 2018 and anyo_fin =2019;
#10 Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
select DEP.nombre, apellido1, apellido2, PE.nombre from persona PE left join profesor PR on PR.id_profesor=PE.id right join departamento DEP on  DEP.id = PR.id_departamento order by  DEP.nombre asc, apellido1 asc, apellido2 asc, PE.nombre asc;
#11 Retorna un llistat amb els professors/es que no estan associats a un departament.
select * from persona PE left join profesor PR on PR.id_profesor = PE.id right join departamento DEP on PR.id_departamento = DEP.id where DEP.nombre = null;
#12 Retorna un llistat amb els departaments que no tenen professors/es associats.
select * from departamento DEP left join profesor PR on DEP.id = PR.id_departamento;
