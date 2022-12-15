
#S2.01 Estructura de datos SQL

## Nivel 1: 

  * Ejercicio 1:

Una óptica, llamada “Cul d'Ampolla”, quiere informatizar la gestión de los clientes/as y ventas de gafas.

En primer lugar, la óptica quiere saber cuál es el proveedor de cada una de las gafas. En concreto quiere saber de cada proveedor:
El nombre
La dirección (calle, número, piso, puerta, ciudad, código postal y país)
Teléfono
Fax
NIF.

La política de compras de la óptica se basa en que las gafas de una marca se comprarán a un único proveedor (así podrá sacar mejores precios), pero pueden comprar gafas de varias marcas a un proveedor. De las gafas quiere saber:
La marca.
La graduación de cada uno de los cristales.
El tipo de montura (flotante, pasta o metálica).
El color de la montura.
El color de cada cristal.
El precio.

De los clientes/as desea almacenar:
El nombre.
La dirección postal.
El teléfono.
El correo electrónico.
La fecha de registro.
Cuando llega un/a cliente/a nuevo, almacenar el/la cliente/a que le ha recomendado el establecimiento (siempre que alguien le haya recomendado).
Nuestro sistema deberá indicar quién ha sido el empleado/a que ha vendido cada anteojo.

  * Ejercicio 2:

Te han contratado para diseñar una web que permita realizar pedidos de comida a domicilio por Internet.

Ten en cuenta las siguientes indicaciones para modelar cómo sería la base de datos del proyecto:
Para cada cliente/a almacenamos un identificador único:
Nombre.
Apellidos.
Dirección.
Código postal.
Localidad.
Provincia.
Número de teléfono.
Los datos de localidad y provincia estarán almacenados en tablas separadas. Sabemos que una localidad pertenece a una única provincia y que una provincia puede tener muchas localidades. Para cada localidad se almacena un identificador único y un nombre. En cada provincia almacenamos un identificador único y un nombre.

Una persona puede realizar muchos pedidos, pero un único pedido sólo puede ser realizado por una única persona. De cada pedido se almacena un identificador único:
Fecha/hora.
Si el pedido es para reparto a domicilio o para recogerlo en tienda.
La cantidad de productos que se han seleccionado de cada tipo.
El precio total.

Un pedido puede constar de uno o varios productos.


Los productos pueden ser pizzas, hamburguesas y bebidas. De cada producto se almacena un identificador único:
Nombre.
Descripción.
Imagen.
Precio.

En el caso de las pizzas existen varias categorías que pueden cambiar de nombre a lo largo del año. Una pizza sólo puede estar dentro de una categoría, pero una categoría puede tener muchas pizzas.


De cada categoría se almacena un identificador único y un nombre. Un pedido es gestionado por una única tienda y una tienda puede manejar muchos pedidos. De cada tienda se almacena un identificador único:
Dirección.
Código postal.
Localidad.
Provincia.


En una tienda pueden trabajar muchos empleados y un empleado sólo puede trabajar en una tienda. De cada empleado/a, se almacena un identificador único:
Nombre.
Apellidos.
NIF.
Teléfono.
Si trabaja como cocinero/ao repartidor/a. Para los pedidos de reparto a domicilio interesa guardar quién es el repartidor/a que hace la entrega del pedido y la fecha/hora del momento de la entrega.
