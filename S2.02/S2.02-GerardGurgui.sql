

/*FABRICANTES-PRODUCTE*/
/*1- Llista el nom de tots els productes que hi ha en la taula producto.*/
SELECT nombre FROM producto;

/*2- Llista els noms i els preus de tots els productes de la taula producto..*/
SELECT nombre,precio FROM producto;

/*3- Llista totes les columnes de la taula producto.*/
SELECT * from producto;

/*4- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).*/
select nombre, concat(precio, "€") as precio_euros, concat (precio, "$") as precio_dolares from producto;

/*5- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.*/
select nombre as producto, concat(precio, "€") as euros, concat (precio, "$") as dolares from producto;

/*6- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula..*/
SELECT UPPER(nombre) as nombre_producto ,precio from producto;

/*7-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.*/
SELECT lower(nombre) as nombre_producto ,precio from producto;

/*8-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant..*/
select nombre, UPPER(substring(nombre,1,2)) from fabricante;

/*9-Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.*/
Select nombre, round(precio, 1) from producto;

/*10-Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
Select nombre, round(precio, 0) from producto;

/*11-Llista el codi dels fabricants que tenen productes en la taula producto.*/
select fabricante.codigo, producto.codigo_fabricante
from fabricante 
inner join producto
on fabricante.codigo = producto.codigo_fabricante;

/*12-Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.*/
select distinct producto.codigo_fabricante, fabricante.codigo
from fabricante 
inner join producto 
on fabricante.codigo = producto.codigo_fabricante;

/*13-Llista els noms dels fabricants ordenats de manera ascendent.*/
SELECT nombre FROM fabricante ORDER BY nombre ASC;

/*14-Llista els noms dels fabricants ordenats de manera descendent.*/
SELECT nombre FROM fabricante ORDER BY nombre DESC;

/*15- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent*/
SELECT nombre,precio FROM producto ORDER BY nombre ASC;

/*16-Retorna una llista amb les 5 primeres files de la taula fabricante.*/
SELECT nombre,precio FROM producto ORDER BY precio DESC;

/*17- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
SELECT nombre FROM fabricante LIMIT 5;

/*18- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.*/
SELECT nombre FROM fabricante LIMIT 3,2;

/*19-Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
SELECT nombre,precio FROM producto ORDER BY precio ASC LIMIT 1;

/*20- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2..*/
SELECT nombre,precio FROM producto ORDER BY precio DESC LIMIT 1;

/*21-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades..*/
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

/*22- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
Ordena el resultat pel nom del fabricant, per ordre alfabètic.*/
select producto.nombre, producto.precio, fabricante.nombre
from producto
inner join fabricante
on producto.codigo = fabricante.codigo
order by fabricante.nombre asc;

/*23- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.*/
select producto.codigo as codigo_produco, producto.nombre as nombre_producto, fabricante.codigo as codigo_fabricante, fabricante.nombre as nombre_fabricante
from producto
inner join fabricante
on producto.codigo = fabricante.codigo;





/*UNIVERSIDAD*/

/*1- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. 
El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
SELECT apellido1,apellido2,nombre
FROM persona
WHERE tipo = "alumno" 
ORDER BY apellido1 ASC;

/*2- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT nombre,apellido1,apellido2 
FROM persona 
WHERE telefono IS NULL
AND tipo = "alumno";

/*3- Retorna el llistat dels alumnes que van néixer en 1999*/
SELECT nombre 
FROM persona 
WHERE fecha_nacimiento 
between "1999-01-01" and "1999-12-31" 
and tipo = "alumno"; 

/*4 - Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
SELECT nombre
FROM persona
WHERE tipo = "profesor" and nif LIKE '%K';

/*5- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7 */
SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1 and id_grado = 7;

/*6- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats.
 El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament.
 El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
select persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre 
from persona
inner join profesor
on profesor.id_profesor = persona.id
inner join departamento on profesor.id_departamento = departamento.id
order by persona.nombre ASC;

/*7- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
SELECT persona.nombre, asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
from asignatura
inner join curso_escolar on asignatura.id = curso_escolar.id
inner join persona on curso_escolar.id = persona.id
where persona.nif = "26902806M";

/*8- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
SELECT departamento.nombre, grado.nombre
from departamento
inner join grado on departamento.id = grado.id
where grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";

/*9- retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
select persona.nombre, persona.apellido1
from persona
inner join asignatura on persona.id = asignatura.id
inner join curso_escolar on asignatura.id = curso_escolar.id
where persona.tipo = "alumno" and curso_escolar.anyo_inicio = 2018;


/*LEFT I RIGHT JOIN*/
/*1- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats.
 El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat.
 El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
 El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
select persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre as nombre_departamento
from persona
left join departamento on persona.id = departamento.id
where persona.tipo = "profesor"
order by departamento.nombre DESC;

/*2- Retorna un llistat amb els professors/es que no estan associats a un departament. */
select persona.id, profesor.id_departamento
from persona
left join profesor
on persona.id = profesor.id_departamento
where persona.tipo = "profesor" and id_departamento is null;


/*3- Retorna un llistat amb els departaments que no tenen professors/es associats. */
select departamento.id, departamento.nombre, profesor.id_departamento
from departamento
left join profesor
on departamento.id = profesor.id_departamento
where id_departamento is null;



/*4- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/
select persona.nombre , asignatura.nombre
from asignatura 
inner join profesor on asignatura.id_profesor = profesor.id_profesor
right join persona on profesor.id_profesor = persona.id
where asignatura.id_profesor is null and persona.tipo = "profesor";




/*5- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.*/
select asignatura.nombre, persona.id
from asignatura
left join profesor 
on asignatura.id_profesor = profesor.id_profesor
left join persona on profesor.id_profesor = persona.id
where persona.nombre is null;




/*CONSULTES RESUM*/

/*1- Retorna el nombre total d'alumnes que hi ha.*/
select count(nombre) from persona
where tipo = "alumno";

/*2- Calcula quants alumnes van néixer en 1999.*/
select count(nombre) from persona
where fecha_nacimiento between '1999-01-01' and '1999-12-31' and tipo = "alumno";


/*3-Calcula quants professors/es hi ha en cada departament. 
El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament.
El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es. */
select count(persona.nombre) as total_profes ,departamento.nombre as nombre_departamento
from profesor 
inner join persona
on profesor.id_departamento = persona.id
inner join departamento
on persona.id = departamento.id
where persona.tipo = "profesor"
group by persona.nombre
order by persona.nombre DESC;


/*5- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun.
 Tingues en compte que poden existir graus que no tenen assignatures associades.
 Aquests graus també han d'aparèixer en el llistat. 
 El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures. */
select grado.nombre, count(asignatura.nombre)
from asignatura
right join grado
on asignatura.id_grado = grado.id
group by grado.nombre
order by grado.nombre desc;




/*6- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun,
 dels graus que tinguin més de 40 assignatures associades.*/
select grado.nombre, count(asignatura.nombre)
from asignatura
right join grado
on asignatura.id_grado = grado.id
group by grado.nombre
having count(asignatura.nombre) > 40;



/*10- Retorna totes les dades de l'alumne/a més jove.*/
select *
from persona
where fecha_nacimiento = (select  max(fecha_nacimiento) from persona);


/*11- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.*/
select departamento.nombre, profesor.id_profesor
from departamento
inner join profesor
on departamento.id = profesor.id_profesor
inner join asignatura 
on profesor.id_profesor = asignatura.id_profesor







