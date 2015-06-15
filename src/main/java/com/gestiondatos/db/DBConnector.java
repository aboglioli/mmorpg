package com.gestiondatos.db;

import com.gestiondatos.ui.LogWindow;

import java.sql.*;

/**
 * Created by kiriost on 15/06/15.
 */
public class DBConnector {
    private Connection conn = null;
    private PreparedStatement prepStmt = null;
    private ResultSet rs = null;

    public DBConnector() {
        try {
            newConnection();
        } catch (Exception exc) {
            LogWindow.add(exc.toString());
        }
    }

    private void newConnection() throws Exception {
        Class.forName(DBConfig.driver);
        conn = DriverManager.getConnection(DBConfig.url, DBConfig.usuario, DBConfig.contrasenia);
        LogWindow.add("- NUEVA CONEXIÓN a BD");
    }

    private void closeConnection() throws Exception {
        conn.close();
    }

    private ResultSet query(String query) throws Exception {
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        LogWindow.add("-- Consulta simple a BD:");
        LogWindow.addBold(query);
        return rs;
    }

    private PreparedStatement queryPrepared(String query) throws Exception {
        PreparedStatement prepStmt = conn.prepareStatement(query);
        LogWindow.add("-- Consulta preparada a BD:");
        LogWindow.addBold(query);
        return prepStmt;
    }

    public String getPersonajes() {
        String res = "";
        try {
            rs = query(DBQueries.personajes);
            while (rs.next()) {
                res += rs.getString("nombre") +" -- "+ rs.getInt("nivel") +" -- "+ rs.getInt("fuerza");
                res += "\n";
            }
        } catch(Exception exc) {
            LogWindow.add(exc.toString());
        }
        return res;
    }

    @Override
    public void finalize() {
        try {
            closeConnection();
        } catch(Exception exc) {
            LogWindow.add(exc.toString());
        }
    }
}
