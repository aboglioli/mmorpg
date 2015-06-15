package com.gestiondatos.mmorpg;

import static spark.Spark.*;
/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args ) {
        int puerto = 8080;
        port(puerto);
        staticFileLocation("/public");
        get("/home/:var", (req, res) -> {
            return req.params(":var");
        });
    }
}
