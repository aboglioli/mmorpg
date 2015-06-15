/* ITEMS */
-- Armas
insert into Item (nombre, inc_fuerza, danio, codigo_tipo_item) values (
	"Espada de madera", 1, 5, 5
);
insert into Item (nombre, inc_vitalidad, danio, codigo_tipo_item) values (
	"Mazo de madera", 1, 8, 8
);
insert into Item (nombre, inc_agilidad, danio, codigo_tipo_item) values (
	"Arco de madera", 1, 4, 6
);
insert into Item (nombre, danio, defensa, codigo_tipo_item) values (
	"Báculo de madera", 1, 6, 10
);

insert into Item (nombre, inc_fuerza, danio, codigo_tipo_item) values (
	"Espada de acero", 3, 10, 5
);
insert into Item (nombre, inc_vitalidad, danio, codigo_tipo_item) values (
	"Mazo de acero", 3, 16, 8
);
insert into Item (nombre, inc_agilidad, danio, codigo_tipo_item) values (
	"Arco de acero", 3, 9, 6
);
insert into Item (nombre, inc_energia, danio, codigo_tipo_item) values (
	"Báculo de acero", 3, 12, 10
);

insert into Item (nombre, inc_fuerza, danio, codigo_tipo_item) values (
	"Lanza de bronce", 5, 15, 7
);
insert into Item (nombre, inc_fuerza, inc_agilidad, inc_energia, inc_vitalidad, codigo_tipo_item) values (
	"Vara encantada", 3, 3, 14, 9, 9
);

-- Armaduras
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Gorro de cuero", 1, 5, 5, 1
);
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Coraza de cuero", 1, 6, 6, 2
);
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Botas de cuero", 1, 4, 7, 4
);
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Guantes de cuero", 1, 3, 5, 3
);

insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Gorro de acero", 3, 6, 8, 1 
);
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Coraza de acero", 3, 5, 10, 2
);
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Botas de acero", 3, 4, 7, 4
);
insert into Item (nombre, inc_fuerza, inc_agilidad, defensa, codigo_tipo_item) values (
	"Guantes de acero", 3, 3, 7, 3
);

insert into Item (nombre, inc_fuerza, inc_agilidad, inc_energia, inc_vitalidad, defensa, codigo_tipo_item) values (
	"Casco de bronce", 12, 12, 12, 12, 20, 1
);
insert into Item (nombre, inc_fuerza, inc_agilidad, inc_energia, inc_vitalidad, defensa, codigo_tipo_item) values (
	"Coraza de bronce", 15, 15, 15, 15, 28, 2
);
insert into Item (nombre, inc_fuerza, inc_agilidad, inc_energia, inc_vitalidad, defensa, codigo_tipo_item) values (
	"Botas de bronce", 10, 10, 10, 10, 18, 4
);
insert into Item (nombre, inc_fuerza, inc_agilidad, inc_energia, inc_vitalidad, defensa, codigo_tipo_item) values (
	"Guantes de bronce", 10, 10, 10, 10, 17, 3
);

-- Joyas y pociones
insert into Item (nombre, inc_fuerza, inc_energia, defensa, codigo_tipo_item) values (
	"Anillo común", 10, 10, 8, 11
);
insert into Item (nombre, inc_fuerza, inc_energia, defensa, codigo_tipo_item) values (
	"Anillo de oro", 15, 15, 15, 11
);
insert into Item (nombre, rec_vida, codigo_tipo_item) values (
	"Poción de vida", 25, 12
);
insert into Item (nombre, rec_mana, codigo_tipo_item) values (
	"Poción de maná", 25, 12
);
