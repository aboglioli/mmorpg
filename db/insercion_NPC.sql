/* NPC */

insert into Personaje (nombre, fuerza, agilidad, energia, vitalidad, numero_mapa) values (
	"Goblin", 2, 2, 2, 10, 1
);
insert into NPC(nombre_personaje, codigo_tipo_npc, hostilidad, atacable) values (
	"Goblin", 4, 'S', 'S'
);

insert into Personaje (nombre, fuerza, agilidad, energia, vitalidad, numero_mapa) values (
	"Goblin jefe", 10, 10, 10, 50, 1
);
insert into NPC(nombre_personaje, codigo_tipo_npc, hostilidad, atacable) values (
	"Goblin jefe", 5, 'S', 'S'
);

insert into Personaje (nombre, fuerza, agilidad, energia, vitalidad, numero_mapa) values (
	"Ladrón", 3, 4, 0, 8, 1
);
insert into NPC(nombre_personaje, codigo_tipo_npc, hostilidad, atacable) values (
	"Ladrón", 4, 'S', 'S'
);

insert into Personaje (nombre, fuerza, agilidad, energia, vitalidad, numero_mapa) values (
	"Guardián", 20, 20, 20, 200, 1
);
insert into NPC(nombre_personaje, codigo_tipo_npc, hostilidad, atacable) values (
	"Guardián", 2, 'N', 'N'
);
