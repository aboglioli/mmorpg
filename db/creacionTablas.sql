/* Creación tablas */
-- Mapas
create table Mundo (
	numero int not null auto_increment,
	nombre varchar(20) not null,
	primary key(numero)    
);

create table Mapa (
	numero int not null auto_increment,
	nombre varchar(20) not null,
	descripcion varchar(128) not null,
	numero_mundo int not null,
	primary key(numero),
	foreign key(numero_mundo) references Mundo (numero)
);

-- Personajes
create table Personaje (
	nombre varchar(32) not null check (len(nombre) > 6),
	nivel int default 0 check(nivel >= 0),
	experiencia int default 0 check(nivel >= 0),
	fuerza int default 1 check(fuerza > 0),
	agilidad int default 1 check(agilidad > 0),
	energia int default 1 check(energia > 0),
	vitalidad int default 1 check(vitalidad > 0),
	vida int default 15 check(vida > 0),
	mana int default 15 check(mana > 0),
	numero_mapa int default 1,
	posicion_x int default 0,
	posicion_y int default 0,
	primary key(nombre),
	foreign key(numero_mapa) references Mapa(numero)
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
	foreign key(nombre_personaje) references Personaje(nombre),
	foreign key(codigo_tipo_npc) references Tipo_NPC(codigo)
);

-- Jugador
create table Estado_Cuenta (
	codigo int not null auto_increment,
	nombre varchar(20) not null,
	descripcion varchar(128),
	primary key(codigo)
);

create table Cuenta (
	usuario varchar(20) not null check (len(usuario) > 6),
	email varchar(32) not null,
	contrasenia char(41) not null,
	fecha_creacion datetime default current_timestamp,
	fecha_modificacion datetime on update current_timestamp,
	codigo_estado int not null default 1,
	primary key(usuario),
	foreign key(codigo_estado) references Estado_Cuenta(codigo)
);

create table Clase (
	codigo int not null auto_increment,
	nombre varchar(20) not null,
	descripcion varchar(256),
	aumento_fuerza float(3,2) default 1.00,
	aumento_agilidad float(3,2) default 1.00,
	aumento_energia float(3,2) default 1.00,
	aumento_vitalidad float(3,2) default 1.00,
	primary key(codigo)
);

create table Jugador (
	nombre_personaje varchar(20) not null,
	usuario_cuenta varchar(20) not null,
	codigo_clase int not null,
	fecha_creacion datetime default current_timestamp,
	primary key(nombre_personaje),
	foreign key(nombre_personaje) references Personaje (nombre),
	foreign key(usuario_cuenta) references Cuenta (usuario),
	foreign key(codigo_clase) references Clase (codigo)
);

-- Items
create table Tipo_Item (
	codigo int not null auto_increment,
	nombre varchar(20) not null,
	equipable char check (equipable in ('S', 'N')),
	consumible char check (consumible in ('S', 'N')),
	primary key(codigo)
);

create table Item (
	codigo int not null auto_increment,
	nombre varchar(20) not null,
	inc_fuerza int default 0,
	inc_agilidad int default 0,
	inc_energia int default 0,
	inc_vitalidad int default 0,
	rec_vida int default 0,
	rec_mana int default 0,
	danio int default 0,
	defensa int default 0,
	codigo_tipo_item int not null,
	primary key(codigo),
	foreign key(codigo_tipo_item) references Tipo_Item(codigo)
);

create table Inventario (
	codigo int not null auto_increment,
	nombre_personaje varchar(32) not null,
	primary key(codigo),
	foreign key(nombre_personaje) references Personaje(nombre)
);

create table Inventario_Item (
	codigo_inventario int not null,
	codigo_item int not null,
	nivel int default 0 check (nivel >= 0),
	primary key(codigo_inventario, codigo_item),
	foreign key(codigo_inventario) references Inventario(codigo),
	foreign key(codigo_item) references Item(codigo)
);

create table Equipamiento (
	codigo int not null auto_increment,
	nombre_personaje varchar(32) not null,
	primary key(codigo),
	foreign key(nombre_personaje) references Personaje(nombre)
);

create table Equipamiento_Item (
	codigo_equipamiento int not null,
	codigo_item int not null check (
		codigo_item in (
			select codigo from Item i, Tipo_Item t
			where i.codigo_tipo_item = t.codigo and t.equipable = 'S'
		)	
	),
	nivel int default 0 check (nivel >= 0),
	primary key(codigo_equipamiento, codigo_item),
	foreign key(codigo_equipamiento) references Equipamiento(codigo),
	foreign key(codigo_item) references Item(codigo)
);

create table Cofre (
	codigo int not null auto_increment,
	usuario_cuenta varchar(32) not null,
	contrasenia char(40) not null,
	primary key (codigo),
	foreign key (usuario_cuenta) references Cuenta (usuario)
);

create table Cofre_Item (
	codigo_cofre int not null,
	codigo_item int not null,
	nivel int default 0 check (nivel >= 0),
	primary key(codigo_cofre, codigo_item),
	foreign key(codigo_cofre) references Cofre(codigo),
	foreign key(codigo_item) references Item(codigo)
);

create table Mapa_Item (
	numero_mapa int not null,
	codigo_item int not null,
	nivel int default 0 check (nivel >= 0),
	posicion_x int,
	posicion_y int,
	primary key(numero_mapa, codigo_item),
	foreign key(numero_mapa) references Mapa(numero),
	foreign key(codigo_item) references Item(codigo)
);

/* Inserción de nomencladores */
insert into Clase (nombre, descripcion, aumento_fuerza, aumento_agilidad) values (
	'Guerrero',
	'Utiliza su fuerza para enfrentar a sus enemigos. Es capaz de manipular gran cantidad de espadas, lanzas, mazos, armaduras.',
	2.5,
	1.5
);
insert into Clase (nombre, descripcion, aumento_energia, aumento_vitalidad) values (
	'Mago',
	'Es capaz de controlar los 4 elementos: agua, tierra, fuego, aire. Y hacer uso de armas que lo dotan de hechizos y conjuros.',
	2.7,
	1.8
);
insert into Clase (nombre, descripcion, aumento_vitalidad, aumento_fuerza) values (
	'Clérigo',
	'Capaz de invocar hechizos par revitalizar a sus aliados o dañar a sus enemigos. Posee gran cantidad de vida.',
	3.5,
	1.8
);
insert into Clase (nombre, descripcion, aumento_agilidad, aumento_fuerza) values (
	'Arquero',
	'Haciendo uso de arcos, flechas y lanzas, es capaz de atacar a sus enemigos desde una distancia segura.',
	4.0,
	1.5
);
insert into Clase (nombre, descripcion) values (
	'GM',
	'Administrador del juegos. Tiene acceso a todos los datos y es capaz de manipular el juego.'
);

insert into Tipo_NPC (nombre, descripcion) values (
	'Vendedor', 'Capaz de proveerte de armas, armaduras y otros items.'
);
insert into Tipo_NPC (nombre, descripcion) values (
	'Ayudante', 'Capaz de asistir en la batalla.'
);
insert into Tipo_NPC (nombre, descripcion) values (
	'Ciudadano', 'Habitante que transita por todos los mapas, incapaz de hacerte daño.'
);
insert into Tipo_NPC (nombre, descripcion) values (
	'Enemigo', 'Enemigo común.'
);
insert into Tipo_NPC (nombre, descripcion) values (
	'Jefe', 'Enemigo difícil de combatir.'
);
insert into Tipo_NPC (nombre, descripcion) values (
	'Demonio', 'Personaje muy difícil de vencer. Se requieren muchas personas para derribarlo.'
);

insert into Mundo (nombre) values ('Mundo 1');
insert into Mundo (nombre) values ('Mundo 2');
insert into Mundo (nombre) values ('Mundo VIP');

insert into Mapa (nombre, descripcion, numero_mundo) values (
	"Bosque 1", "Inicial, desde donde todos parten.", 1
);
insert into Mapa (nombre, descripcion, numero_mundo) values (
	"Bosque 2", "Comienza la aventura.", 1
);
insert into Mapa (nombre, descripcion, numero_mundo) values (
	"Bosque 3", "Enemigos cada vez más poderosos.", 1
);
insert into Mapa (nombre, descripcion, numero_mundo) values (
	"Bosque 1", "Inicial, desde donde todos parten.", 3
);
insert into Mapa (nombre, descripcion, numero_mundo) values (
	"Bosque 2", "Comienza la aventura.", 3
);
insert into Mapa (nombre, descripcion, numero_mundo) values (
	"Bosque 3", "Enemigos cada vez más poderosos.", 3
);

insert into Tipo_Item (nombre, equipable, consumible) values ('Casco', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Pechera', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Guantes', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Botas', 'S', 'N');

insert into Tipo_Item (nombre, equipable, consumible) values ('Espada', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Arco', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Lanza', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Mazo', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Vara', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Báculo', 'S', 'N');

insert into Tipo_Item (nombre, equipable, consumible) values ('Joya', 'S', 'N');
insert into Tipo_Item (nombre, equipable, consumible) values ('Poción', 'N', 'S');
insert into Tipo_Item (nombre, equipable, consumible) values ('Hechizo', 'S', 'S');
insert into Tipo_Item (nombre, equipable, consumible) values ('Reliquia', 'S', 'S');

insert into Estado_Cuenta (nombre, descripcion) values ("Habilitada", "El usuario de la Cuenta puede jugar.");
insert into Estado_Cuenta (nombre, descripcion) values ("Bloqueada",
	"El usuario se encuentra bloqueado porque pudo haber infringido las políticas y/o reglas del juego.");
insert into Estado_Cuenta (nombre, descripcion) values ("Cerrada", "El usuario o un administrador cerró esta cuenta. Esto puede ser temporal o permanentemente.");
