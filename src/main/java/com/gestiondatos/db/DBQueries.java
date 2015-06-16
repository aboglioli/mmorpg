package com.gestiondatos.db;

/**
 * Created by kiriost on 15/06/15.
 */
public interface DBQueries {
    /* Usuaario */
    String cuenta = "select usuario, email from Cuenta" +
            " where usuario = ? and contrasenia = password(?)";
    String nueva_cuenta = "insert into Cuenta (usuario, email, contrasenia)" +
            " values (?, ?, password(?))";
    String jugador = "select * from Jugador, Personaje" +
            " where Jugador.nombre_personaje = ? and Jugador.nombre_personaje = Personaje.nombre";

    /* GM */
    String cuentas = "select * from Cuenta";
    String jugadores = "select * from Jugador, Personaje" +
            " where Jugador.nombre_personaje = Personaje.nombre";

}
