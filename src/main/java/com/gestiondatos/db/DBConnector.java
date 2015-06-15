package com.gestiondatos.db;

import com.gestiondatos.ui.LogWindow;

import java.sql.*;

/**
 * Created by kiriost on 15/06/15.
 */
public class DBConnector {
    private Connection conn = null;
    private ResultSet rs = null;

    public DBConnector() {
        try {
            newConnection();
        } catch (Exception exc) {
            LogWindow.addRed(exc.toString());
        }
    }

    private void newConnection() throws Exception {
        Class.forName(DBConfig.driver);
        conn = DriverManager.getConnection(DBConfig.url, DBConfig.usuario, DBConfig.contrasenia);
        LogWindow.add("<i>NUEVA CONEXIÓN a BD</i>");
    }

    private void closeConnection() throws Exception {
        conn.close();
    }

    public ResultSet query(String query) {
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (Exception exc) {
            LogWindow.addRed(exc.toString());
        }
        LogWindow.addBold(query);
        return rs;
    }

    public PreparedStatement preparedQuery(String query) {
        PreparedStatement prepStmt = null;
        try {
            prepStmt = conn.prepareStatement(query);
        } catch (Exception exc) {
            LogWindow.addRed(exc.toString());
        }
        LogWindow.addBold(query);
        return prepStmt;
    }

    public ResultSet getResultSet() {
        return rs;
    }

    @Override
    public void finalize() {
        try {
            closeConnection();
        } catch(Exception exc) {
            LogWindow.addRed(exc.toString());
        }
    }
}
