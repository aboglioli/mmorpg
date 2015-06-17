package com.gestiondatos.db;

/**
 * Created by kiriost on 15/06/15.
 */
public interface DBQueries {
    /* Usuario */
    String cuenta = "select usuario, email from Cuenta" +
        " where usuario = ? and contrasenia = password(?)";
    String nueva_cuenta = "insert into Cuenta (usuario, email, contrasenia)" +
        " values (?, ?, password(?))";

    String jugadores_usuario = "select p.nombre, c.nombre clase, p.nivel, p.experiencia,"+
        " p.fuerza, p.agilidad, p.energia, p.vitalidad, p.vida, p.mana, m.nombre mapa, p.posicion_x, p.posicion_y"+
        " from Cuenta cu, Jugador j, Personaje p, Clase c, Mapa m"+
        " where cu.usuario = ? and cu.usuario = j.usuario_cuenta and j.nombre_personaje = p.nombre and"+
        " j.codigo_clase = c.codigo and p.numero_mapa = m.numero";

    /* GM */
    String gmCuentas = "select * from Cuenta";
    String gmJugadores = "select * from Jugador, Personaje" +
        " where Jugador.nombre_personaje = Personaje.nombre";

}
