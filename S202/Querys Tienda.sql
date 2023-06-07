	#1. Llista el nom de tots els productes que hi ha en la taula producto.
    SELECT nombre FROM producto;
    #2. Llista els noms i els preus de tots els productes de la taula producto.
    Select nombre, precio from producto;
    #3. Llista totes les columnes de la taula producto.
    select * from producto;
    #4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
   select nombre, precio, (precio * 1.08436) PrecioUSD from producto;
    #5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
    select nombre nom_de_producto, precio euros, (precio * 1.08436) dòlars from producto; 
    #6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
	select ucase(nombre) nombre, precio from producto;
    #7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
    select lcase(nombre) nombre, precio from producto;
    #8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
    select nombre, ucase(left(nombre,2)) Dos_Mayus from fabricante;
    #9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
    select nombre, round(precio) from producto;
    #10. Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
    select nombre, floor(precio) from producto;
    #11. Llista el codi dels fabricants que tenen productes en la taula producto.
    select FB.codigo from fabricante FB inner join producto PT where FB.codigo = PT.codigo_fabricante;
    #12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
    select distinct FB.codigo from fabricante FB inner join producto PT where FB.codigo = PT.codigo_fabricante;
    #13. Llista els noms dels fabricants ordenats de manera ascendent.
    select nombre from fabricante order by nombre asc;
    #14. Llista els noms dels fabricants ordenats de manera descendent.
    select nombre from fabricante order by nombre desc;
    #15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
    select nombre from producto order by nombre, precio desc;
    #16. Retorna una llista amb les 5 primeres files de la taula fabricante.
    select * from fabricante limit 0,5;
    #17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
    select * from fabricante limit 3,2;
    #18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
    select nombre, precio from producto where precio = (select min(precio) from producto);
    #19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
    select nombre,precio from producto where precio = (select max(precio) from producto);
    #20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
    select nombre from producto where codigo_fabricante = 2;
    #21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
    select PD.nombre, precio, FD.nombre from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo;
    #22 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
    select PD.nombre, precio, FD.nombre from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo order by FD.nombre asc;
    #23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
    select   PD.nombre, precio, FD.nombre, FD.codigo from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo;
    #24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
    select PD.nombre, precio, FD.nombre from producto PD inner join fabricante FD where precio = (select min(precio) from producto) && PD.codigo_fabricante=FD.codigo;
    #25 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
    select PD.nombre, precio, FD.nombre from producto PD inner join fabricante FD where precio = (select max(precio) from producto) && PD.codigo_fabricante=FD.codigo;
    #26 Retorna una llista de tots els productes del fabricant Lenovo.
    select * from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo and FD.nombre = "Lenovo";
    #27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
    select * from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo and FD.nombre in ('Crucial') and precio >=200;
    #28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
    select * from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo and (FD.nombre = "Asus" or FD.nombre = "Hewlett-Packard" or FD.nombre = "Seagate");
    #29 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
    select * from producto PD inner join fabricante FD where Pd.codigo_fabricante = FD.codigo and FD.nombre in('Asus','Hewlett-Packard','Seagate');
    #30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
    select PD.nombre, precio from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo and right(FD.nombre,1) = 'e'; 
    #31 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
    select PD.nombre, precio from producto PD inner join fabricante FD where PD.codigo_fabricante = FD.codigo and FD.nombre like '%w%';
	#32 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
    select PD.nombre, precio, FD.nombre from producto PD inner join fabricante FD ON PD.codigo_fabricante = FD.codigo where precio >=180 order by precio asc, PD.nombre desc;
    #33 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
    select distinct FD.codigo, FD.nombre from fabricante FD inner join producto PD where FD.codigo = PD.codigo_fabricante;
    #34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
	select FD.nombre, FD.codigo, PD.nombre from fabricante FD left join producto PD on FD.codigo = PD.codigo_fabricante;
    #35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
    select FD.nombre 'fabricante sin producto'  from fabricante FD left join producto PD on PD.codigo_fabricante = FD.codigo where PD.nombre is null;
    #36 Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
    select * from producto PD, fabricante FD  where PD.codigo_fabricante = FD.codigo and FD.nombre = 'lenovo';
    