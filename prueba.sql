-- CREACIÓN DE BASE DE DATOS Y LAS TABLAS SEGÚN MODELO --

kennojc=# CREATE DATABASE prueba;
CREATE DATABASE
kennojc=# \c prueba
You are now connected to database "prueba" as user "kennojc".

CREATE TABLE clientes(
client_id SERIAL,
client_name VARCHAR(255),
rut INT,
client_adress VARCHAR(255),
PRIMARY KEY (client_id)
);

CREATE TABLE facturas(
 invoice_id INT,
 date DATE,
 subtotal INT,
 cliente_id INT REFERENCES clientes(client_id),
 PRIMARY KEY (invoice_id)
 );

CREATE TABLE categorias(
 category_id VARCHAR(255),
 cat_name VARCHAR(255),
 cat_description TEXT,
 PRIMARY KEY (category_id)
 );

CREATE TABLE productos(   
product_id VARCHAR(255),
product_name VARCHAR(255),
unit_price INT,
product_description TEXT,
id_categoria VARCHAR(255) REFERENCES categorias(category_id),
PRIMARY KEY (product_id)
);

CREATE TABLE factura_producto(
id SERIAL,
id_invoice INT REFERENCES facturas(invoice_id),
id_product VARCHAR(255) REFERENCES productos(product_id),
PRIMARY KEY (id)
);

-- AGREGAR LOS DATOS SOLICITADOS --

 INSERT INTO clientes (client_name, rut , client_adress) VALUES ('Juanito' , 151778874 , 'Sherwood 1212');
 INSERT INTO clientes (client_name, rut , client_adress) VALUES ('Johnny' , 150688652 , 'Calle 100');
 INSERT INTO clientes (client_name, rut , client_adress) VALUES ('Giovanni' , 151787434 , 'Italia 990');
 INSERT INTO clientes (client_name, rut , client_adress) VALUES ('Johan' , 251485438 , 'Avenida Africa 10');
 INSERT INTO clientes (client_name, rut , client_adress) VALUES ('Yann' , 267882338 , 'St Laurent 35');

INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('music01' ,' disco_vinilo', 50 , 'Disco de vinilo para grabación Hi-Fi');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('tecno15' ,' teclado', 25 , 'Teclado de lujo');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('tecno53' ,'monitor43', 150 , 'Monitor gigante OLED');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('food210' ,'almendra', 1 , 'Almendra por unidad');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('music84' ,'compact_disc', 45 , 'CD Éxitos A.Plaza');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('food356' ,'faisan', 500 , 'Asado de Faisán');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('games35' ,'mortalkombat', 12 , 'Mortal Kombat Falso');
INSERT INTO productos (product_id, product_name, unit_price, product_description) VALUES ('games13' ,'mario1', 12 , 'Mario Bros.2');

INSERT INTO categorias (category_id, cat_name, cat_description) VALUES ('Ociosos','Entretenimiento','Productos de entretenimiento general');
INSERT INTO categorias (category_id, cat_name, cat_description) VALUES ('Trabajólicos','Trabajo','Productos de trabajo premium');
INSERT INTO categorias (category_id, cat_name, cat_description) VALUES ('Alimentos','Comidas','Productos para comer en las pruebas');

INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1225, '2020-03-21', 46, 1 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1228, '2020-03-23', 25, 1 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1534, '2020-03-28', 225, 3 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1576, '2020-04-11', 24, 3 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1584, '2020-04-26', 524, 3 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1714, '2020-04-27', 45, 4 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1814, '2020-05-17', 95, 5 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1826, '2020-05-18', 176, 5 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1843, '2020-06-21', 569, 5 );
INSERT INTO facturas (invoice_id , date, subtotal, cliente_id) VALUES (1848, '2020-06-23', 50, 5 );

-- Error : No le puse Categorías a los Productos !!! --
UPDATE productos SET id_categoria='Alimentos' WHERE product_name='almendra';
UPDATE productos SET id_categoria='Alimentos' WHERE product_name='faisan';
UPDATE productos SET id_categoria='Trabajólicos' WHERE product_name=' teclado';
UPDATE productos SET id_categoria='Trabajólicos' WHERE product_name='monitor43';
UPDATE productos SET id_categoria='Ociosos' WHERE product_name=' disco_vinilo';
UPDATE productos SET id_categoria='Ociosos' WHERE product_name='compact_disc';
UPDATE productos SET id_categoria='Ociosos' WHERE product_name='mortalkombat';
UPDATE productos SET id_categoria='Ociosos' WHERE product_name='mario1';



-- Productos que se compraron --
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1225, 'music84');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1225, 'food210');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1228, 'games35');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1228, 'games13');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1228, 'food210');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1534, 'music01');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1534, 'tecno15');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1534, 'tecno53');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1576, 'games35');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1576, 'games13');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1584, 'food356');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1584, 'games35');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1584, 'games13');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1714, 'music84');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1814, 'music84');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1814, 'music01');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1826, 'tecno15');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1826, 'tecno53');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1826, 'food210');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1843, 'games13');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1843, 'games35');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1843, 'food356');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1843, 'music84');
INSERT INTO factura_producto (id_invoice, id_product) VALUES (1848, 'music01');

-- INFORMACIÓN DESDE LAS TABLAS --

--¿Que cliente realizó la compra más cara?--
-- fue YANN
SELECT client_name FROM clientes 
INNER JOIN facturas ON clientes.client_id=facturas.cliente_id 
WHERE subtotal = (SELECT MAX(subtotal) FROM facturas);

--¿Que cliente pagó sobre 100 de monto?--
-- Giovanni y Yann

SELECT client_name FROM clientes INNER JOIN facturas ON clientes.client_id=facturas.cliente_id WHERE subtotal > 100 GROUP BY client_name;

-- ¿Cuantos clientes han comprado el producto 6 : Faisan, porque es el 6 en correlativo solamente --
-- Respuesta : Son dos.

SELECT count(client_id) FROM clientes INNER JOIN facturas ON clientes.client_id = facturas.cliente_id
WHERE facturas.invoice_id IN (SELECT id_invoice FROM factura_producto WHERE id_product='food356');

-- Para saber quiénes fueron esos dos....Yann y Giovanni --
SELECT client_name FROM clientes INNER JOIN facturas ON clientes.client_id = facturas.cliente_id
WHERE facturas.invoice_id IN (SELECT id_invoice FROM factura_producto WHERE id_product='food356');





















