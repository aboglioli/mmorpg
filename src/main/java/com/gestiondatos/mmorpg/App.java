package com.gestiondatos.mmorpg;

import com.gestiondatos.db.QueryToJSON;
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
            log.add("Petición a <font color='blue'>"+ req.uri() +"</font> desde "+ req.ip() +
                    " con navegador [<font color='gray'>"+ req.userAgent() +"</font>]");
        });

        // Get

        // Post
        post("/cuenta/crear", "application/json", (req, res) -> {
            return "{}"; //QueryToJSON.newCuenta(req.body());
        });
        post("/cuenta/ingresar", "application/json", (req, res) -> {
            return QueryToJSON.getCuenta(req.body());
        });
    }
}
