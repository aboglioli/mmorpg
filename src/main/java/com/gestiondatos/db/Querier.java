package com.gestiondatos.db;

import com.gestiondatos.ui.LogWindow;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Created by kiriost on 15/06/15.
 */
public class Querier {

    /* Usuario */
    public static Object[] getCuenta(String usuario, String contrasenia) {
        DBConnector db = new DBConnector();
        PreparedStatement prep = db.preparedQuery(DBQueries.cuenta);
        ArrayList<Object> ret = new ArrayList<Object>();

        try {
            prep.setString(1, usuario);
            prep.setString(2, contrasenia);
            ResultSet rs = prep.executeQuery();
            if(rs.next()) {
                ret.add(rs.getString("usuario"));
                ret.add(rs.getString("email"));
            }
        } catch (SQLException exc) {
            LogWindow.addRed(exc.toString());
        }

        return ret.toArray();
    }

    public static Object[] setCuenta(String usuario, String email, String contrasenia) {
        DBConnector db = new DBConnector();
        PreparedStatement prep = db.preparedQuery(DBQueries.nueva_cuenta);
        ArrayList<Object> ret = new ArrayList<Object>();

        try {
            prep.setString(1, usuario);
            prep.setString(2, email);
            prep.setString(3, contrasenia);
            int i = prep.executeUpdate();
            if(i > 0) {
                ret.add(usuario);
                ret.add(email);
            }
        } catch (SQLException exc) {
            LogWindow.addRed(exc.toString());
        }

        return ret.toArray();
    }

    public static Object[][] getJugadores(String usuario) {
        DBConnector db = new DBConnector();
        PreparedStatement prep = db.preparedQuery(DBQueries.jugadores_usuario);
        ArrayList<ArrayList<Object>> ret = new ArrayList<ArrayList<Object>>();

        try {
            prep.setString(1, usuario);
            ResultSet rs = prep.executeQuery();
            while (rs.next()) {
                ArrayList<Object> jug = new ArrayList<Object>();
                jug.add(rs.getString("nombre"));
                jug.add(rs.getString("clase"));
                jug.add(rs.getString("nivel"));
                jug.add(rs.getString("experiencia"));
                jug.add(rs.getString("fuerza"));
                jug.add(rs.getString("agilidad"));
                jug.add(rs.getString("energia"));
                jug.add(rs.getString("vitalidad"));
                jug.add(rs.getString("vida"));
                jug.add(rs.getString("mana"));
                jug.add(rs.getString("mapa"));
                jug.add(rs.getString("posicion_x"));
                jug.add(rs.getString("posicion_y"));
                ret.add(jug);
            }
        } catch (SQLException exc) {
            LogWindow.addRed(exc.toString());
        }
        Object[][] r = new Object[ret.size()][];
        int i = 0;
        for (ArrayList<Object> l : ret)
          r[i++] = l.toArray(new Object[l.size()]);

        return r;
    }
}
