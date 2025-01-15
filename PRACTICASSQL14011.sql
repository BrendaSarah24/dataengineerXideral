USE practicas;
SELECT * FROM empleados WHERE edad > 30;


ALTER TABLE empleados
ADD COLUMN ventas TINYINT(1),
 ADD COLUMN descripcion TEXT,
 ADD COLUMN fecha DATE;


SET SQL_SAFE_UPDATES = 0;

UPDATE empleados
SET descripcion = 'Hubo venta'
WHERE nombre IN ( "Circe", "Hanna");

UPDATE empleados
SET ventas = '1'
WHERE nombre IN ( "Circe", "Hanna");

SELECT * FROM empleados;

SELECT * FROM empleados
WHERE ventas='0';