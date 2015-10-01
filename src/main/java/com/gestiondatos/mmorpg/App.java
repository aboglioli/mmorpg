package com.gestiondatos.mmorpg;

import com.gestiondatos.db.Querier;
import com.gestiondatos.ui.LogWindow;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import java.util.List;

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
            log.add("Petición a <font color='blue'><b>"+ req.uri() +"</b></font> desde "+ req.ip() +
                    " con navegador [<font color='gray'>"+ req.userAgent() +"</font>]");
        });

        // Get
        get("/jugadores/", "application/json", (req, res) -> {
            if(req.session().attribute("usuario") != null) {
                Object ret[][] =  Querier.getJugadores(req.session().attribute("usuario"));
                JSONArray jsonArr = new JSONArray();
                for(Object obj[] : ret) {
                    JSONObject json = new JSONObject();
                    json.put("nombre", obj[0]);
                    json.put("clase", obj[1]);
                    json.put("nivel", obj[2]);
                    json.put("experiencia", obj[3]);
                    json.put("fuerza", obj[4]);
                    json.put("agilidad", obj[5]);
                    json.put("energia", obj[6]);
                    json.put("vitalidad", obj[7]);
                    json.put("vida", obj[8]);
                    json.put("mana", obj[9]);
                    json.put("mapa", obj[10]);
                    json.put("posicion_x", obj[11]);
                    json.put("posicion_y", obj[12]);
                    jsonArr.add(json);
										return;
                }
                return jsonArr.toJSONString();
            }
            return "{\"msg\": \"Usuario inválido\"}";
        });
        get("/atacar/jugador/:nombre", "application/json", (req, res) -> {
            if(req.session().attribute("usuario") != null) {
                Object ret[] = Querier.atacarJugador(req.session().attribute("usuario"), req.params(":nombre"));
                if(ret.length > 0) {
                    JSONArray jsonArr = new JSONArray();
                    for(Object enfrentamiento : ret) {
                       jsonArr.add((String)enfrentamiento);
                    }
                    return jsonArr.toJSONString();
                }
            }
            return "{\"msg\": \"Usuario inválido o no existen jugadores\"}";
        });

        // Post
        post("/cuenta/crear", "application/json", (req, res) -> {
            JSONObject json = (JSONObject)JSONValue.parse(req.body());
            Object ret[] = Querier.setCuenta((String)json.get("usuario"), (String)json.get("email"),
                    (String)json.get("contrasenia"));
            if(ret.length > 0) {
                json = new JSONObject();
                json.put("usuario", ret[0]);
                json.put("email", ret[1]);
                req.session().attribute("usuario", ret[0]);
                return json.toJSONString();
            }
            return "{\"msg\": \"No se pudo crear la cuenta\"}";
        });
        post("/cuenta/ingresar", "application/json", (req, res) -> {
            JSONObject json = (JSONObject) JSONValue.parse(req.body());
            Object ret[] = Querier.getCuenta((String)json.get("usuario"), (String)json.get("contrasenia"));
            if (ret.length > 0) {
                json = new JSONObject();
                json.put("usuario", ret[0]);
                json.put("email", ret[1]);
                req.session().attribute("usuario", ret[0]);
                return json.toJSONString();
            }
            return "{\"msg\": \"La cuenta ingresada no existe\"}";
        });
        post("/jugador", "application/json", (req, res) -> {
            JSONObject json = (JSONObject) JSONValue.parse(req.body());
            if (req.session().attribute("usuario").equals((String) json.get("usuario"))) {
                Object ret[] = Querier.setJugador((String) json.get("usuario"), (String) json.get("nombre"),
                        (String) json.get("clase"));
                if (ret.length > 0) {
                    json = new JSONObject();
                    json.put("nombre", ret[0]);
                    json.put("clase", ret[1]);
                    json.put("nivel", ret[2]);
                    json.put("experiencia", ret[3]);
                    json.put("fuerza", ret[4]);
                    json.put("agilidad", ret[5]);
                    json.put("energia", ret[6]);
                    json.put("vitalidad", ret[7]);
                    json.put("vida", ret[8]);
                    json.put("mana", ret[9]);
                    json.put("mapa", ret[10]);
                    json.put("posicion_x", ret[11]);
                    json.put("posicion_y", ret[12]);
                    return json.toJSONString();
                }
            }
            return "{\"msg\": \"El personaje no se pudo crear\"}";
        });
    }
}
