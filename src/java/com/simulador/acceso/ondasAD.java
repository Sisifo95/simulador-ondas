/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.simulador.acceso;

import simulador.comunes.onda;
import simulador.comunes.ondas;
import com.simulador.conexion.conexionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author luis
 */
public class ondasAD extends ondas {

    public String getSQLOnda(Integer opc) {

        String strSQL = "";
        switch (opc) {
            case 1:
                strSQL = "SELECT * FROM onda WHERE caso_onda='finito' AND dimension_onda='2D' ORDER BY id_onda DESC";
                break;
            case 2:
                strSQL = "SELECT * FROM onda WHERE caso_onda='finito' AND dimension_onda='3D' ORDER BY id_onda DESC";
                break;
            case 3:
                strSQL = "SELECT * FROM onda WHERE caso_onda='infinito' AND dimension_onda='2D' ORDER BY id_onda DESC";
                break;
            case 4:
                strSQL = "SELECT * FROM onda WHERE caso_onda='infinito' AND dimension_onda='3D' ORDER BY id_onda DESC";
                break;

        }

        return strSQL;
    }

    public void getListaOndas(Integer opc) {
        conexionDB c = new conexionDB();
        List<onda> list = new ArrayList<>();
        if (c.conectar() != null) {
            try {
                ResultSet rs = c.execSQL(getSQLOnda(opc));
                while (rs.next()) {
                    ondaAD obj = new ondaAD();
                    obj.setOndas(rs);
                    list.add(obj);
                }
            } catch (SQLException e) {
                System.out.println("Error en el listar ondas" + e);
            }
            setObjListaOndas(list);
        }
    }

}
