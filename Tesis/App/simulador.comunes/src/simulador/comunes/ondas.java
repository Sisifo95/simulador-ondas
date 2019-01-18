/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package simulador.comunes;

import java.util.List;

/**
 *
 * @author luis
 */
public class ondas {

    private List<onda> objListaOndas;

    public ondas() {

    }

    public List<onda> getObjListaOndas() {
        return objListaOndas;
    }

    public void setObjListaOndas(List<onda> objListaOndas) {
        this.objListaOndas = objListaOndas;
    }

    public void ListaOndasAdd(onda obj) {
        this.objListaOndas.add(obj);
    }

}
