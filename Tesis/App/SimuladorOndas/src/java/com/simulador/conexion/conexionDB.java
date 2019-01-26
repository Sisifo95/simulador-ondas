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
        String cadena = "jdbc:postgresql://ec2-107-22-162-8.compute-1.amazonaws.com/dagm35oa09p3v1";
        String user = "vjigmwexqewgpt";
        String pass = "7d9c8ee4cf46483e1d008a18a00bf2b06d74687a360bcbf329998ae4cd6c5d6d";
        
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
