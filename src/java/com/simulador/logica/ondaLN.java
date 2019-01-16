/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.simulador.logica;

import com.google.gson.Gson;
import simulador.comunes.ondas;
import com.simulador.acceso.ondasAD;
import com.simulador.acceso.ondaAD;
import java.sql.SQLException;

/**
 *
 * @author luis
 */
public class ondaLN {

    public String getlistaOndas2DFinito(String cedula) {

        Gson gson = new Gson();
        ondasAD ad = new ondasAD();
        ad.getListaOndas(1);
        return gson.toJson(ad, ondas.class);
    }

    public String getlistaOndas3DFinito(String cedula) {

        Gson gson = new Gson();
        ondasAD ad = new ondasAD();
        ad.getListaOndas(2);
        return gson.toJson(ad, ondas.class);
    }

    public String getlistaOndas2DInfinito(String cedula) {

        Gson gson = new Gson();
        ondasAD ad = new ondasAD();
        ad.getListaOndas(3);
        return gson.toJson(ad, ondas.class);
    }

    public String getlistaOndas3DInfinito(String cedula) {

        Gson gson = new Gson();
        ondasAD ad = new ondasAD();
        ad.getListaOndas(4);
        return gson.toJson(ad, ondas.class);
    }
    
      //INSERT
    public Integer guardarOnda(String JSON) throws SQLException {
        Gson gson = new Gson();
        ondaAD ad = gson.fromJson(JSON, ondaAD.class);
        return ad.guardarOnda();
    }

}
