package com.simulador.conexion;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conexionDB {
    private Connection conex;

    public conexionDB(){
        conex = null;        
    }

    public Connection getConex() {
        return conex;
    }

    public void setConex(Connection conex) {
        this.conex = conex;
    }
    
   
    public Connection conectar()
    {        
        String cadena = "jdbc:postgresql://ec2-54-243-223-245.compute-1.amazonaws.com/dcu7do3mp74ph7";
        String user = "jlzylxhaqxakfq";
        String pass = "bc8cffc2769274a1ba71c3f4204cd708e8dab37bbca186b4d80fb28f01b44904";
        
        try {
            Class.forName("org.postgresql.Driver");
            conex = DriverManager.getConnection(cadena,user,pass);            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger("ClaseConexion").log(Level.SEVERE, "Error al intentar conectarse a la BD", ex);
        }
        return conex;
    }
 
    

    //EJECUTAR CONSULTAS
    public ResultSet execSQL(String instruccionSQL) {
        ResultSet result = null;
        try {
            Statement stt = conex.createStatement();
            result = stt.executeQuery(instruccionSQL);
        } catch (SQLException ex) {
            Logger.getLogger("ClaseConexion").log(Level.SEVERE, "Error al ejecutar la consultaSQL", ex);
        }
        return result;
    }

    //EJECUTAR INSTRUCCIONES UPDATE
    public Integer execUPD(String instruccionSQL) {
        Integer result = null;
        try {
            Statement stt = conex.createStatement();
            result = stt.executeUpdate(instruccionSQL);
        } catch (SQLException ex) {
            Logger.getLogger("ClaseConexion").log(Level.SEVERE, "Error al ejecutar el updateSQL", ex);
        }
        return result;
    }    
}
