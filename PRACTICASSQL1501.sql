CREATE DATABASE Practicajoin2;
USE Practicajoin2;
CREATE TABLE Empleados (id_empleado INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50),salario DECIMAL(10,2), id_departamento INT);
CREATE TABLE Departamentos (id_departamento INT AUTO_INCREMENT PRIMARY KEY,nombre_departamento VARCHAR(50));
INSERT INTO Departamentos (nombre_departamento) VALUES ('Recursos Humanos'),('Desarrollo'),('Ventas'),('Marketing');
INSERT INTO Empleados (nombre, salario, id_departamento)
VALUES ('Juan Pérez', 25000.00, 1), ('María López', 30000.00, 2), ('Luis Gómez', 28000.00, 3), ('Ana García', 27000.00, NULL), ('Carlos Torres', 35000.00, 2);

SELECT * FROM Departamentos;
SELECT * FROM Empleados;

SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
INNER JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;
    
    

    
SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
LEFT JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;


SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
RIGHT JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;



INSERT INTO Departamentos (nombre_departamento) VALUES ('Produccion'),('Recursos Humanos');
SELECT * FROM Departamentos;

INSERT INTO Empleados (nombre, salario, id_departamento)
VALUES ('Brenda Rosas', 26000.00, 1),('Paola Rosas', 57000.00, 2),('Alejandra Rosas', 15000.00, 3), 
('Paco García', 45000.00, NULL), ('Brandon García', 10000.00, NULL);

INSERT INTO Empleados (nombre, salario, id_departamento)
VALUES ('Jesus Rosas', 26000.00, 7),('Laura Rosas', 57000.00, 6);

SELECT * FROM Departamentos;
SELECT * FROM Empleados;

SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
INNER JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;
    
    
SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
LEFT JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;
    

SELECT 
    Empleados.nombre AS Nombre_Empleado,
    Departamentos.nombre_departamento AS Departamento,
    Empleados.salario AS Salario
FROM 
    Empleados
RIGHT JOIN 
    Departamentos
ON 
    Empleados.id_departamento = Departamentos.id_departamento;


ALTER TABLE Empleados ADD COLUMN edad INT;
DELETE FROM Empleados
WHERE id_empleado BETWEEN 15 AND 26;

UPDATE Empleados
SET edad = FLOOR(RAND() * (65 - 18 + 1)) + 18
WHERE id_empleado BETWEEN 1 AND 14;


SELECT * FROM Empleados WHERE salario>50000; 

SELECT Departamentos.nombre_departamento FROM Departamentos;

SELECT nombre FROM Empleados WHERE id_departamento = (SELECT id_departamento FROM Departamentos WHERE nombre_departamento = 'Ventas'); 

SELECT Empleados.nombre, Empleados.salario, Departamentos.nombre_departamento AS Departamento 

FROM Empleados 

INNER JOIN Departamentos 

ON Empleados.id_departamento = departamentos.id_departamento; 


SELECT nombre, salario   

FROM Empleados   

WHERE salario > (SELECT AVG(salario) FROM Empleados); 

AlTER TABLE Empleados ADD COLUMN ventas INT;
UPDATE Empleados SET region="CANADA" WHERE id_empleado IN (3,6,11,13);

UPDATE Empleados
SET ventas = FLOOR(1 + (RAND() * 100))
WHERE id_empleado BETWEEN 1 AND 14;

SELECT * FROM Empleados;

SELECT region, SUM(ventas) AS total_ventas   
FROM Empleados   
GROUP BY region;   


CREATE TABLE productos (nombre VARCHAR(50), precio DECIMAL (10,2));
INSERT INTO productos (nombre, precio) VALUES
('Producto A', 25.99),
('Producto B', 40.50),
('Producto C', 15.75),
('Producto D', 120.00),
('Producto E', 55.30);

SELECT * FROM productos;

SELECT nombre, precio   
FROM productos   
ORDER BY precio DESC   
LIMIT 5;  

CREATE DATABASE empresa;

USE empresa;
CREATE TABLE cliente (id_cliente INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50),id_pedido INT);

CREATE TABLE pedido (id_pedido INT AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50),
 precio DECIMAL(10,2),fecha DATE,id_cliente INT);

INSERT INTO cliente (nombre, id_pedido) VALUES
('Carlos García', 1),
('Ana López', 2),
('Juan Pérez', 3),
('María Sánchez', 4),
('Luis Fernández', 5);


INSERT INTO pedido (nombre, precio, fecha, id_cliente) VALUES
('Pedido 1', 100.50, '2025-01-10', 1),
('Pedido 2', 250.75, '2025-01-11', 2),
('Pedido 3', 150.00, '2025-01-12', 3),
('Pedido 4', 500.00, '2025-01-13', 4),
('Pedido 5', 75.25, '2025-01-14', 5);


INSERT INTO pedido (nombre, precio, fecha, id_cliente) VALUES
('Pedido 6', 100.50, '2024-01-10', 1),
('Pedido 7', 250.75, '2024-12-11', 3);


SELECT * FROM pedido;

SELECT nombre, id_cliente  
FROM cliente   
WHERE id_cliente IN (SELECT id_cliente FROM pedido WHERE fecha  BETWEEN '2025-01-01' AND '2025-01-31'); 

USE empresa;
CREATE TABLE productos (nombre VARCHAR(50), precio DECIMAL (10,2), categoria VARCHAR(50));
INSERT INTO productos (nombre, precio,categoria) VALUES
('Producto A', 25.99,"electrodomesticos"),
('Producto B', 40.50,"tecnologia"),
('Producto C', 15.75,"deportes"),
('Producto D', 120.00,"electrodomesticos"),
('Producto E', 55.30,"tecnologia");



ALTER TABLE productos ADD COLUMN ventas DECIMAL(10,2);

USE empresa;
UPDATE productos
SET ventas = 2000
WHERE categoria = "Producto E";


SELECT * FROM productos;

UPDATE productos
SET ventas = FLOOR(10 + (RAND() * 190));  -- Esto genera números aleatorios entre 10 y 200.


SELECT categoria, AVG(ventas) AS promedio_ventas, SUM(ventas) AS suma_ventas   
FROM productos   
GROUP BY categoria;   


SELECT c.nombre, c.region   

FROM clientes c   

JOIN pedidos p ON c.cliente_id = p.cliente_id   

WHERE p.monto > 500;  




USE  practicajoin2; 
SELECT * FROM cliente;
SELECT * FROM empleados;
SELECT * FROM productos;
SELECT * FROM pedido;
SELECT * FROM ventas;

ALTER TABLE empleados
DROP COLUMN ventas;

CREATE TABLE ventas (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_nombre VARCHAR(100),
    empleado_id INT,
    monto DECIMAL(10, 2)
);


INSERT INTO ventas (producto_nombre, empleado_id, monto)
VALUES 
    ('Producto A', 1, 25.99),
    ('Producto B', 2, 40.50),
    ('Producto A', 2, 25.99),
    ('Producto C', 3, 15.75),
    ('Producto B', 4, 40.50),
    ('Producto D', 5, 120.00),
    ('Producto E', 5, 55.30),
    ('Producto A', 1, 25.99),
    ('Producto C', 3, 15.75),
    ('Producto B', 7, 40.50);



SELECT empleados.nombre, SUM(ventas.monto) AS total_ventas, COUNT(ventas.venta_id) AS cantidad_ventas
FROM empleados
JOIN ventas ON empleados.id_empleado = ventas.empleado_id
GROUP BY empleados.id_empleado
HAVING COUNT(ventas.venta_id) >= 3;