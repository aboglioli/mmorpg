create table Cuenta
(usuario varchar(20) not null,
 email varchar(32) not null,
 contrasenia char(40) not null,
 primary key(usuario));
 
create table Mundo
(numero int not null auto_increment,
 nombre varchar(20) not null,
 primary key(numero));
 
create table Mapa
(numero int not null auto_increment,
 nombre varchar(20) not null,
 nombre_archivo varchar(64) not null,
 numero_mundo int not null,
 posicion_x float(5,2) not null,
 posicion_y float(5,2) not null,
 primary key(numero),
 foreign key(numero_mundo) references Mundo (numero));
 
create table Personaje
(nombre varchar(32) not null,
 nivel int,
 fuerza int,
 agilidad int,
 energia int,
 vitalidad int,
 vida int,
 mana int,
 usuario_cuenta varchar(20) not null,
 numero_mapa int,
 posicion_x float(5,2),
 posicion_y float(5,2),
 primary key(nombre),
 foreign key(usuario_cuenta) references Cuenta (usuario),
 foreign key(numero_mapa) references Mapa (numero));

create table Tipo_Enemigo
(codigo int not null auto_increment,
 nombre varchar(20) not null,
 descripcion varchar(256),
 primary key(codigo));

create table Enemigo
(nombre_personaje varchar(20) not null,
 codigo_tipo_enemigo int not null,
 primary key(nombre_personaje),
 foreign key(nombre_personaje) references Personaje (nombre),
 foreign key(codigo_tipo_enemigo) references Tipo_Enemigo (codigo));
 
 create table Clase
(codigo int not null auto_increment,
 nombre varchar(20) not null,
 descripcion varchar(256),
 primary key(codigo));

create table Jugador
(nombre_personaje varchar(20) not null,
 codigo_clase int not null,
 primary key(nombre_personaje),
 foreign key(nombre_personaje) references Personaje (nombre),
 foreign key(codigo_clase) references Clase (codigo));
