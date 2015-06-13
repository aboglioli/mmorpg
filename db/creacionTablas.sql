-- Mapas
create table Mundo (
 numero int not null auto_increment,
 nombre varchar(20) not null,
 primary key(numero)
);
 
create table Mapa (
 numero int not null auto_increment,
 nombre varchar(20) not null,
 nombre_archivo varchar(64) not null,
 numero_mundo int not null,
 primary key(numero),
 foreign key(numero_mundo) references Mundo (numero)
);

-- Personajes
create table Personaje (
 nombre varchar(32) not null,
 nivel int,
 fuerza int,
 agilidad int,
 energia int,
 vitalidad int,
 vida int,
 mana int,
 numero_mapa int,
 posicion_x float(5,2),
 posicion_y float(5,2),
 primary key(nombre),
 foreign key(numero_mapa) references Mapa (numero)
);

-- NPCs
create table Tipo_NPC (
 codigo int not null auto_increment,
 nombre varchar(20) not null,
 descripcion varchar(256),
 primary key(codigo)
);

create table NPC (
 nombre_personaje varchar(20) not null,
 codigo_tipo_npc int not null,
 hostilidad char default 'N' check (hostilidad in ('S', 'N')),
 atacable char default 'N' check (atacable in ('S', 'N')),
 primary key(nombre_personaje),
 foreign key(nombre_personaje) references Personaje (nombre),
 foreign key(codigo_tipo_npc) references Tipo_NPC (codigo)
);

-- Jugador
create table Cuenta (
 usuario varchar(20) not null,
 email varchar(32) not null,
 contrasenia char(40) not null,
 primary key(usuario)
);

create table Clase (
 codigo int not null auto_increment,
 nombre varchar(20) not null,
 descripcion varchar(256),
 primary key(codigo)
);

create table Jugador (
 nombre_personaje varchar(20) not null,
 usuario_cuenta varchar(20) not null,
 codigo_clase int not null,
 primary key(nombre_personaje),
 foreign key(nombre_personaje) references Personaje (nombre),
 foreign key(usuario_cuenta) references Cuenta (usuario)
 foreign key(codigo_clase) references Clase (codigo)
);

-- Items
create table Item (
	codigo int not null auto_increment,
	nombre varchar(20) not null,
	inc_fuerza int default 0,
	inc_agilidad int default 0,
	inc_energia int default 0,
	inc_vitalidad int default 0,
	primary key(codigo)
);

create table Consumible (

);

create table Equipable (

);

create table Joya (

);

create table Arma (

);

create table Tipo_Armadura (

);

create table Armadura (

);

create table Equipamiento (
	codigo int not null auto_increment,
	nombre_personaje varchar(32) not null,
	codigo_casco int default null,
	codigo_armadura int default null,
	codigo_guantes int default null,
	codigo_botas int default null,
	codigo_arma int default null,
	primary key(codigo),
	foreign key(codigo_casco) references Armadura(codigo),
	foreign key(codigo_armadura) references Armadura(codigo),
	foreign key(codigo_guantes) references Armadura(codigo),
	foreign key(codigo_botas) references Armadura(codigo),
	foreign key(codigo_arma) references Arma(codigo),
);

create table Mapa_Item (

);

-- Inventario
create table Cofre (
	codigo int not null auto_increment,
	usuario_cuenta varchar(32) not null,
	contrasenia char(40) not null,
	primary key (codigo),
	foreign key (usuario_cuenta) references Cuenta (usuario)
);

create table Cofre_Item (

);

create table Inventario (
	codigo int not null auto_increment,
	personaje_nombre varchar(32) not null,
	primary key (codigo),
	foreign key (pesonaje_nombre) references Personaje(nombre)
);

create table Inventario_Item (
	codigo_inventario int not null,
	codigo_item int not null,
	nivel int default 0,
	primary key(codigo_inventario, codigo_item),
	foreign key(codigo_inventario) references Inventario(codigo),
	foreign key(codigo_item) references Item(codigo)
);