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
        String cadena = "jdbc:postgresql://ec2-23-21-171-25.compute-1.amazonaws.com/db2cjimtn8o1vm";
        String user = "neezdzthqeguim";
        String pass = "df0ae5ccaf2a5971fbb687ff12a03303c93a48575e9b559b8aa1f90156b6210f";
        
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
