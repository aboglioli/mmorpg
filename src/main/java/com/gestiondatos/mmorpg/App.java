package com.gestiondatos.mmorpg;

import com.gestiondatos.db.DBConnector;
import com.gestiondatos.ui.LogWindow;

import static spark.Spark.*;
/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args ) {
        // Interfaz gráfica
        LogWindow log = new LogWindow();
        log.add("Iniciando aplicación...");

        // Servidor web
        int puerto = 8080;
        port(puerto);
        staticFileLocation("/public");
        log.add("Servidor web iniciado en puerto 8080: http://localhost:8080");

        // API REST
        before((req, res) -> {
            log.addSeparator();
            log.add("Petición a /home desde "+ req.ip() +" con navegador ["+ req.userAgent() +"]");
        });
        after((req, res) -> {
            log.addSeparator();
        });
        get("/personajes", (req, res) -> {
            DBConnector db = new DBConnector();
            String ret = db.getPersonajes();
            db = null;
            return ret;
        });
    }
}
