package com.gestiondatos.ui;

import javax.swing.*;
import java.awt.*;

/**
 * Created by kiriost on 15/06/15.
 */
public class LogWindow extends JFrame {
    private static JEditorPane log;
    private static String logMsg = "";
    public LogWindow() {
        super("MMORPG Server - Log");
        this.setSize(800, 600);
        makePane();
        this.setVisible(true);
    }

    private void makePane() {
        this.setLayout(new BorderLayout());

        log = new JEditorPane();
        log.setContentType("text/html");
        log.setEditable(false);
        JScrollPane scrollLog = new JScrollPane(log);
        JLabel footer = new JLabel("Grupo 06 - Gestion de Datos");

        this.add(scrollLog, BorderLayout.CENTER);
        this.add(footer, BorderLayout.SOUTH);
    }

    public static synchronized void addSeparator() {
        logMsg += "<hr><br>";
        render();
    }

    public static synchronized void add(String text) {
        logMsg += text +"<br>";
        render();
    }

    public static synchronized void addBold(String text) {
        logMsg += "<b>"+ text +"</b><br>";
        render();
    }

    public static synchronized void addRed(String text) {
        logMsg += "<font color='red'>"+ text +"</font><br>";
        render();
    }

    public static synchronized void clear() {
        logMsg = "";
        render();
    }

    private static void render() {
        log.setText("<html>"+ logMsg +"</html>");
    }
}
