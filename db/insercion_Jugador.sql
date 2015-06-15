/* CUENTA */
insert into Cuenta (usuario, email, contrasenia) values (
	"gm", "alanboglioli@gmail.com", password("poqw2des")
);
insert into Cuenta (usuario, email, contrasenia) values (
	"prueba", "alanboglioli@gmail.com", password("1234")
);
insert into Cuenta (usuario, email, contrasenia) values (
	"prueba2", "alanboglioli@gmail.com", password("1234")
);

/* JUGADOR */
insert into Personaje (nombre, fuerza, agilidad, energia, vitalidad, numero_mapa) values ("GM", 50, 50, 50, 200, 1);
insert into Jugador(nombre_personaje, usuario_cuenta, codigo_clase) values ("GM", "gm", 5);
insert into Inventario(nombre_personaje) values ("GM");
insert into Inventario_Item(codigo_inventario, codigo_item, nivel) values (1, 25, 1);

insert into Personaje (nombre) values ("Alan");
insert into Jugador(nombre_personaje, usuario_cuenta, codigo_clase) values ("Alan", "gm", 2);
insert into Inventario(nombre_personaje) values ("Alan");
insert into Inventario_Item(codigo_inventario, codigo_item, nivel) values (2, 8, 2);
insert into Inventario_Item(codigo_inventario, codigo_item, nivel) values (2, 12, 5);

insert into Personaje (nombre) values ("Noob");
insert into Jugador(nombre_personaje, usuario_cuenta, codigo_clase) values ("Noob", "prueba", 1);
insert into Inventario(nombre_personaje) values ("Noob");
