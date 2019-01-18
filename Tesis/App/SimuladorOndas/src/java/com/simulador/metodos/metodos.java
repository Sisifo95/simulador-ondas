/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.simulador.metodos;

import com.simulador.logica.ondaLN;
import java.sql.SQLException;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author luis
 */
public class metodos {
    
    public String getlistaOndas2DFinito() {
        ondaLN ln = new ondaLN();
        String result = "";
        try {
            result = ln.getlistaOndas2DFinito(result);
        } catch (Exception e) {
            result = "ERROR" + e;
        }
        return result;
    }

    public String getlistaOndas2DInfinito() {
        ondaLN ln = new ondaLN();
        String result = "";
        try {
            result = ln.getlistaOndas2DInfinito(result);
        } catch (Exception e) {
            result = "ERROR" + e;
        }
        return result;
    }

    public String getlistaOndas3DFinito() {
        ondaLN ln = new ondaLN();
        String result = "";
        try {
            result = ln.getlistaOndas3DFinito(result);
        } catch (Exception e) {
            result = "ERROR" + e;
        }
        return result;
    }

    public String getlistaOndas3DInfinito() {
        ondaLN ln = new ondaLN();
        String result = "";
        try {
            result = ln.getlistaOndas3DInfinito(result);
        } catch (Exception e) {
            result = "ERROR" + e;
        }
        return result;
    }

    public Integer guardarOnda(@WebParam(name = "JSONAusencia") String JSON) {
        Integer result;
        try {
            ondaLN ln = new ondaLN();
            result = ln.guardarOnda(JSON);
        } catch (SQLException e) {
            System.out.println("error" + e);
            result = 0;
        }
        return result;
    }
}
