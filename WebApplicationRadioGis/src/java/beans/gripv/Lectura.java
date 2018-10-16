/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.gripv;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fido
 */
public class Lectura {

    private int idlectura;
    private String fecha;
    private String variables;
    private String equipos_idequipo;
    private  List<Variable> listaVariables = new ArrayList<>();

    public int getIdlectura() {
        return idlectura;
    }

    public void setIdlectura(int idlectura) {
        this.idlectura = idlectura;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getVariables() {
        return variables;
    }

    public void setVariables(String variables) {
        this.variables = variables;
    }

    public String getEquipos_idequipo() {
        return equipos_idequipo;
    }

    public void setEquipos_idequipo(String equipos_idequipo) {
        this.equipos_idequipo = equipos_idequipo;
    }

    public List<Variable> getListaVariables() {
        return listaVariables;
    }

    public void setListaVariables(List<Variable> listaVariables) {
        this.listaVariables = listaVariables;
    }

    
    public boolean guardarLectura() {
        boolean exito = false;
        ConexionBDgripv conexion = new ConexionBDgripv();
        if (conexion.setAutoCommitBD(false)) {
            boolean inserto = conexion.insertarBD("INSERT INTO lecturas(fecha,variables,equipos_idequipo) "
                    + " VALUES ('" + this.fecha + "','" + this.variables + "','" + this.equipos_idequipo + "');  ");
            if (inserto) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        conexion.cerrarConexion();
        return exito;
    }

}
