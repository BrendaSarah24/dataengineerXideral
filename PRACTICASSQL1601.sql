CREATE DATABASE tienda_articuos;
USE tienda_articuos;
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10 , 2 ),
    id_categoria INT,
    stock INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
);
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    email VARCHAR(50)
);
CREATE TABLE ventas(
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );
    
INSERT INTO categorias (nombre_categoria)
 VALUES ('Xbox'), ('Tenis'), ('Ropa'), ('Artículos para jóvenes');
 
INSERT INTO productos (nombre_producto, precio, id_categoria, stock) 
VALUES
('Xbox Series X', 499.99, 1, 30), 
('Xbox Series S', 299.99, 1, 50), 
('Tenis Nike Air Max', 120.00, 2, 100), 
('Tenis Adidas Ultraboost', 180.00, 2, 80), 
('Camiseta Nike', 25.00, 3, 200), 
('Pantalón Levi\'s', 45.00, 3, 150), 
('Mochila para jóvenes', 35.00, 4, 120),
('Auriculares para jóvenes', 60.00, 4, 75);

INSERT INTO clientes (nombre_cliente, email) 
VALUES 
('Carlos Pérez', 'carlos@example.com'),
('Ana Gómez', 'ana@example.com'),
('Luis Martínez', 'luis@example.com'),
('Marta Rodríguez', 'marta@example.com');
 
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha) 
VALUES
(1, 1, 2, '2025-01-05'),
(2, 3, 1, '2025-01-10'),
(3, 5, 3, '2025-01-12'),
(4, 7, 1, '2025-01-14');



SELECT clientes.nombre_cliente, SUM(ventas.cantidad) AS Total_cantidad FROM ventas INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente GROUP BY clientes.nombre_cliente;
SELECT 
    productos.nombre_producto,
    SUM(ventas.cantidad) AS total_vendido
FROM 
    productos
LEFT JOIN 
    ventas ON productos.id_producto = ventas.id_producto
GROUP BY 
    productos.nombre_producto
ORDER BY 
    total_vendido DESC;
    
    
--  Obtener el precio promedio de los productos por categoría (usando AVG)
     
SELECT 
    categorias.nombre_categoria,
    AVG(productos.precio) AS precio_promedio
FROM 
    productos
INNER JOIN 
    categorias ON productos.id_categoria = categorias.id_categoria
GROUP BY 
    categorias.nombre_categoria
LIMIT 0, 1000;


SELECT 
    MAX(precio) AS producto_mas_caro,
    MIN(precio) AS producto_mas_barato
FROM 
    productos;
    
    
    
SELECT 
    clientes.nombre_cliente, 
    (SELECT SUM(ventas.cantidad) 
     FROM ventas 
     WHERE ventas.id_cliente = clientes.id_cliente) AS cantidad_total_comprada,
    (SELECT SUM(ventas.cantidad * productos.precio) 
     FROM ventas
     INNER JOIN productos ON ventas.id_producto = productos.id_producto 
     WHERE ventas.id_cliente = clientes.id_cliente) AS total_venta
FROM 
    clientes
LIMIT 0, 1000;


-- Obtener los productos con stock bajo (usando WHERE y COUNT)
SELECT 
    nombre_producto,
    stock
FROM 
    productos
WHERE 
    stock < 50;
    
SELECT * from productos;

SELECT nombre_producto,stock,(SELECT COUNT(*) FROM productos WHERE stock < 10) AS cantidad_productos_bajos FROM productos WHERE stock < 10 ORDER BY stock ASC;
   
SELECT 
    nombre_producto,
    stock,
    (SELECT 
            COUNT(*)
        FROM
            productos
        WHERE
            stock <= 50) AS cantidad_productos_bajos
FROM
    productos
WHERE
    stock <= 50
ORDER BY stock ASC;


-- Hacer una consulta que nos proporcione los precios que estén entre 120.00 y 180.00
SELECT * FROM productos;
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM ventas;
SELECT * FROM productos WHERE precio BETWEEN 120.00 AND 180.00;


-- Obtener los productos que han sido comprados por más de un cliente
SELECT 
    productos.nombre_producto,
    COUNT(DISTINCT ventas.id_cliente) AS clientes_distintos
FROM 
    productos
JOIN 
    ventas ON productos.id_producto = ventas.id_producto
GROUP BY 
    productos.nombre_producto
HAVING 
    COUNT(DISTINCT ventas.id_cliente) > 1;


-- JOIN: Unimos las tablas productos y ventas a través de id_producto para conocer qué clientes han comprado cada producto.COUNT(DISTINCT ventas.id_cliente): Contamos los clientes distintos que han comprado cada producto. Utilizamos DISTINCT para evitar contar más de una vez a un mismo cliente si compró el mismo producto varias veces. HAVING: Filtramos para mostrar solo los productos que han sido comprados por más de un cliente.

-- Obtener el total de ventas por cada categoría

SELECT 
    categorias.nombre_categoria,
    SUM(ventas.cantidad * productos.precio) AS total_ventas_categoria
FROM 
    categorias
JOIN 
    productos ON categorias.id_categoria = productos.id_categoria
JOIN 
    ventas ON productos.id_producto = ventas.id_producto
GROUP BY 
    categorias.nombre_categoria
ORDER BY 
    total_ventas_categoria DESC;
    
-- Obtener los productos que no han sido vendidos
 SELECT 
   productos.nombre_producto,
   productos.stock
FROM 
   productos
LEFT JOIN 
   ventas ON productos.id_producto = ventas.id_producto
WHERE 
   ventas.id_venta IS NULL;