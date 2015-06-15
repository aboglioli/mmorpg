package com.gestiondatos.db;

/**
 * Created by kiriost on 15/06/15.
 */
public interface DBQueries {
    String cuentas = "select * from Cuenta";
    String personajes = "select nombre, nivel, fuerza, vitalidad from Personaje";
    String jugadores = "select * from Jugador, Personaje" +
            "where Jugador.nombre_personaje = Personaje.nombre_personaje";
}
