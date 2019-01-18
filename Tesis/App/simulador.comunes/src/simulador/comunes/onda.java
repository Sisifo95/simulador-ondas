/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package simulador.comunes;

/**
 *
 * @author luis
 */
public class onda {
    
    Integer id_onda;
    String coeficiente_elasticidad;
    String posicion_inicial;
    String velocidad_inicial;
    String caso_onda;
    String dimension_onda;

    public Integer getId_onda() {
        return id_onda;
    }

    public void setId_onda(Integer id_onda) {
        this.id_onda = id_onda;
    }

    public String getCoeficiente_elasticidad() {
        return coeficiente_elasticidad;
    }

    public void setCoeficiente_elasticidad(String coeficiente_elasticidad) {
        this.coeficiente_elasticidad = coeficiente_elasticidad;
    }

    public String getPosicion_inicial() {
        return posicion_inicial;
    }

    public void setPosicion_inicial(String posicion_inicial) {
        this.posicion_inicial = posicion_inicial;
    }

    public String getVelocidad_inicial() {
        return velocidad_inicial;
    }

    public void setVelocidad_inicial(String velocidad_inicial) {
        this.velocidad_inicial = velocidad_inicial;
    }

    public String getCaso_onda() {
        return caso_onda;
    }

    public void setCaso_onda(String caso_onda) {
        this.caso_onda = caso_onda;
    }

    public String getDimension_onda() {
        return dimension_onda;
    }

    public void setDimension_onda(String dimension_onda) {
        this.dimension_onda = dimension_onda;
    }
       
}
