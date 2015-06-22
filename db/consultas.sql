/* Nomencladores */
select * from Clase;
select * from Tipo_Item;
select * from Tipo_NPC;
select * from Mundo;
select Mundo.numero numero_mundo, Mundo.nombre nombre_mundo, Mapa.numero numero_mapa, Mapa.nombre nombre_mapa
from Mundo, Mapa where Mapa.numero_mundo = Mundo.numero;

/* Todas las Cuentas con sus Estado */
select c.usuario, c.email, c.fecha_creacion, c.fecha_modificacion, ec.nombre
from Cuenta c, Estado_Cuenta ec
where c.codigo_estado = ec.codigo;

/* Todos los Jugadores con sus Clases y Mapas, con las posiciones */
select j.usuario_cuenta, p.nombre, c.nombre, j.fecha_creacion, p.nivel, p.experiencia,
				p.fuerza, p.agilidad, p.energia, p.vitalidad, p.vida, p.mana, m.nombre, p.posicion_x, p.posicion_y
from Jugador j, Personaje p, Clase c, Mapa m
where j.nombre_personaje = p.nombre and j.codigo_clase = c.codigo and p.numero_mapa = m.numero
order by j.usuario_cuenta, p.nombre;

/* Todos los Items con el Tipo de Item */
select ti.nombre tipo, i.nombre, i.inc_fuerza, i.inc_agilidad, i.inc_energia, i.inc_vitalidad, i.rec_vida, i.rec_mana, i.danio, i.defensa 
from Item i, Tipo_Item ti
where i.codigo_tipo_item = ti.codigo
order by ti.nombre;

/* Todos los Jugadores o Personajes que pertenecen a una determinada Cuenta */
select j.usuario_cuenta, p.nombre, c.nombre clase, j.fecha_creacion, p.nivel, p.experiencia,
	p.fuerza, p.agilidad, p.energia, p.vitalidad, p.vida, p.mana, m.nombre mapa, p.posicion_x, p.posicion_y
from Cuenta cu, Jugador j, Personaje p, Clase c, Mapa m
where cu.usuario = "GM" and cu.usuario = j.usuario_cuenta and j.nombre_personaje = p.nombre and
	j.codigo_clase = c.codigo and p.numero_mapa = m.numero;

/* Cantidad de Jugadores por Cuenta */
select cu.usuario, cu.email, count(j.nombre_personaje) cant_personajes
from Cuenta cu, Jugador j
where cu.usuario = j.usuario_cuenta
group by cu.usuario
order by cu.usuario;

/* Cantidad por Items que poseen los Jugadores, con almenos 1 Item */
select j.nombre_personaje, count(*)
from Jugador j, Inventario inv, Inventario_Item inv_i, Item i
where inv.nombre_personaje = j.nombre_personaje and inv.codigo = inv_i.codigo_inventario and inv_i.codigo_item = i.codigo
group by j.nombre_personaje
order by j.nombre_personaje;

/* Items que posee determinado Jugador */
select i.nombre, ti.nombre tipo
from Jugador j, Inventario inv, Inventario_Item inv_i, Item i, Tipo_Item ti
where j.nombre_personaje = "GM" and inv.nombre_personaje = j.nombre_personaje and inv.codigo = inv_i.codigo_inventario and inv_i.codigo_item = i.codigo and
			i.codigo_tipo_item = ti.codigo
order by i.nombre, ti.nombre;

/* Jugadores con sus incrementos debido a la Clase a la que pertenecen */
select p.nombre, c.nombre clase, p.nivel, p.experiencia, p.fuerza*c.aumento_fuerza, p.agilidad*c.aumento_agilidad,
	p.energia*c.aumento_energia, p.vitalidad*c.aumento_vitalidad, p.vida, p.mana
from Cuenta cu, Jugador j, Personaje p, Clase c
where cu.usuario = j.usuario_cuenta and j.nombre_personaje = p.nombre and j.codigo_clase = c.codigo
