package com.gestiondatos.db;

import com.gestiondatos.ui.LogWindow;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by kiriost on 15/06/15.
 */
public class QueryToJSON {

    /* Usuario */
    public static String getCuenta(String body) {
        DBConnector db = new DBConnector();
        PreparedStatement prep = db.preparedQuery(DBQueries.cuenta);

        JSONObject json = (JSONObject)JSONValue.parse(body);

        try {
            prep.setString(1, (String)json.get("usuario"));
            prep.setString(2, (String)json.get("contrasenia"));
            ResultSet rs = prep.executeQuery();
            if(rs.next()) {
                json.remove("contrasenia");
                json.put("email", rs.getString("email"));
                return json.toJSONString();
            }
        } catch (SQLException exc) {
            LogWindow.addRed(exc.toString());
        }

        return "{\"msg\": \"Usuario no existe\"}";
    }

    public static String newCuenta(String body) {
        DBConnector db = new DBConnector();
        PreparedStatement prep = db.preparedQuery(DBQueries.cuenta);

        JSONObject json = (JSONObject)JSONValue.parse(body);

        try {
            prep.setString(1, (String)json.get("usuario"));
            prep.setString(2, (String)json.get("contrasenia"));
            ResultSet rs = prep.executeQuery();
            if(rs.next()) {
                json.remove("contrasenia");
                json.put("email", rs.getString("email"));
                return json.toJSONString();
            }
        } catch (SQLException exc) {
            LogWindow.addRed(exc.toString());
        }

        return "{\"error\": \"Usuario no existe\"}";
    }

    /* GM */
    public static String getJugador() {
        DBConnector db = new DBConnector();
        ResultSet rs = db.query(DBQueries.jugadores);

        JSONArray jsonArray = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject json = new JSONObject();
                json.put("nombre_personaje", rs.getString("nombre_personaje"));
                json.put("nivel", rs.getString("nivel"));
                jsonArray.add(json);
            }
        } catch (SQLException exc) {
            LogWindow.addRed(exc.toString());
        }
        return jsonArray.toJSONString();
    }
}
