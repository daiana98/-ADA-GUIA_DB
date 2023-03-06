create database informacion;

use informacion;

create table registros(
id int auto_increment,
nombre varchar(12) not null,
apellido varchar(20) not null,
genero char,
fecha_cumpleaños date not null,
ciudad varchar(15) not null,
telefono varchar(20) not null,
primary key(id)
);

insert into registros
(nombre,apellido,genero,fecha_cumpleaños,ciudad,telefono)
values
('Daiana','Quispe','F','1998-05-17','Salta','1154678934'),
('Rocio','Misme','F','1994-07-02','La Plata','1134267800'),
('Eusebio','Cachi','M','1970-08-11','Jujuy','1133668745'),
('Juan','Mamani','M','1995-09-01','Mendoza','1154227899'),
('David','Altamirano','M','1960-01-01','Jujuy','1143226787'),
('Oscar','Saldaña','M','2001-04-29','Salta','1134256557'),
('Paula','Ochoa','F','1967-06-07','Rosario','1144225689'),
('Emilio','Duarte','M','2000-12-25','San Juan','1199445358'),
('Jimena','Baez','F','1996-08-19','Corrientes','1122114570'),
('Sara','Vargas','F','1987-09-21','Rosario','1160098065'),
('Marcos','Aspi','M','1997-04-23','Corrientes','1133227689'),
('Violeta','Quispe','F','1999-03-15','Quilmes','1143226677');

select *
from registros;

#Consultar el nombre y apellido de todos los registros cargados, separados por " , ". - 
#📌Utilizar CONCAT, agregando un apodo temporal a esa columna “Atajo”.
select concat(nombre, ',',apellido) as 'Atajo'
from registros;

#Consultar y traer los nombres y apellidos de manera ascendente.
select nombre, apellido
from registros
order by nombre, apellido asc;

#Consultar la ciudad de los registros cargados
select ciudad
from registros;

#Consultar los registros de género F
select *
from registros
where genero = 'F';

#Consultar los registros de género M.
select *
from registros
where genero = 'M';

#Consultar el recuento de cuántos géneros F cargados.
select count(genero) as 'Recuento Genero F'
from registros
where genero = 'F';

#Consultar el recuento de géneros M están cargados.
select count(genero) as 'Recuento Genero M'
from registros
where genero = 'M';

#En una consulta: traer el día y mes de cumpleaños de todos los registros de la tabla.
select concat(day(fecha_cumpleaños),'-', month(fecha_cumpleaños)) as 'Dia y Mes de Cumpleaños'
from registros;

#En una consulta: traer el año de la fecha de cumpleaños de todos los registros de la tabla.
select year(fecha_cumpleaños) as 'Año de Cumpleaños'
from registros;

#Traer el registro con la agrupación y recuento de las ciudades cargadas.
select count(ciudad), ciudad
from registros
group by ciudad;

#Eliminar el registro con el id 3.
delete 
from registros
where id = 3;

#Modificar la persona con id 7, su apellido cargado por “Salvatore”, su ciudad por “Island”, y su teléfono por 2345678.
update registros
set apellido = 'Salvatore', ciudad = 'Island', telefono = '2345678'
where id=7;

#Consultar que los cambios fueron hechos
select *
from registros;

#Eliminar todos los registros que tienen como apellido la inicial “M”.
delete 
from registros
where apellido like 'M%';

#Eliminar los registros que tienen como finalización la “O” en su nombre.
delete 
from registros
where nombre like '%o';

#Consultar todos los registros del teléfono.
select telefono
from registros;

#Añadir una columna nueva, llamada “Ubicación”
alter table registros
ADD ubicacion VARCHAR(20);

#Cambiar el nombre de la columna añadida por ultimo por “Dirección”
alter table registros
change ubicacion direccion VARCHAR(20);

#Insertar 5 registros mas en la tabla, estos registros deberán incluir la dirección.
insert into registros
(nombre,apellido,genero,fecha_cumpleaños,ciudad,telefono,direccion)
values
('Anabel','Quisbert','F','1991-02-10','Jujy','1153478004','Escalada 1987'),
('Maribel','Ledesma','F','1980-06-09','Misiones','1123440078','Mozart 222'),
('Jose','Burgos','M','1997-09-10','La Plata','1123225566','Rodo 3467'),
('Diego','Avagliano','M','1990-11-12','Mendoza','1156778900','Pueyrredon 3267'),
('Guadalupe','Baez','F','2002-03-10','Rosario','1122556478','Yerbal 678');

#Mostrar todos los registros.
select *
from registros;
