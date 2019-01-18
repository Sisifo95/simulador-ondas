/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.simulador.acceso;

import simulador.comunes.onda;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.simulador.conexion.conexionDB;

/**
 *
 * @author luis
 */
public class ondaAD extends onda {

    public void setOndas(ResultSet rs) throws SQLException {

        this.setId_onda(rs.getInt("id_onda"));
        this.setCaso_onda(rs.getString("caso_onda"));
        this.setPosicion_inicial(rs.getString("posicion_inicial"));
        this.setVelocidad_inicial(rs.getString("velocidad_inicial"));
        this.setDimension_onda(rs.getString("dimension_onda"));
        this.setCoeficiente_elasticidad(rs.getString("coeficiente_elasticidad"));

    }

    public String getSQLGuardarOnda() {

        String strInsert = " INSERT INTO onda("
                + "coeficiente_elasticidad, posicion_inicial, velocidad_inicial, caso_onda, "
                + "dimension_onda)"
                + "VALUES ( '" + this.getCoeficiente_elasticidad() + "','" + this.getPosicion_inicial() + "', '" + this.getVelocidad_inicial() + "', '" + this.getCaso_onda() + "', "
                + "'" + this.getDimension_onda() + "')";
        return strInsert;
    }

    //INSERT
    public Integer guardarOnda() throws SQLException {

        conexionDB c = new conexionDB();
        Integer rs = null;
        if (c.conectar() != null) {
            String SQL = getSQLGuardarOnda();
            rs = c.execUPD(SQL);
        }
        return rs;
    }

}
