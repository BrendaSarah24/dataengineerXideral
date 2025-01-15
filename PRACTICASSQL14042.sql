USE practicas;
create table empleados(nombre varchar(50),edad int);
select * from empleados;
insert into empleados values("Circe",30);
insert into empleados values("Jose",56);
insert into empleados values("Hanna",32);

select * from empleados where edad>=30;