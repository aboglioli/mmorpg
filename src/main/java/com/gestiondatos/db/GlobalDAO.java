package com.gestiondatos.db;

import com.gestiondatos.ui.LogWindow;
import org.json.simple.JSONObject;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by kiriost on 15/06/15.
 */
public class GlobalDAO {
    public static String getJugador() {
        DBConnector db = new DBConnector();
        ResultSet rs = db.query(DBQueries.jugadores);

        JSONObject json = new JSONObject();
        json.put("nombre", "algo");
        json.put("nivel", new Integer(35));
        return json.toString();
    }
}
