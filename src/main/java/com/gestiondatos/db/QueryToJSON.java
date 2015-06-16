package com.gestiondatos.db;

import com.gestiondatos.ui.LogWindow;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by kiriost on 15/06/15.
 */
public class QueryToJSON {
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
