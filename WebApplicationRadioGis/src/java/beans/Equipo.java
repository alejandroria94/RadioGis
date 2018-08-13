/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fido
 */
public class Equipo {

    String idequipo;
    String nombre;
    int direccion;
    String ubicacion;

    public String getIdequipo() {
        return idequipo;
    }

    public void setIdequipo(String idequipo) {
        this.idequipo = idequipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDireccion() {
        return direccion;
    }

    public void setDireccion(int direccion) {
        this.direccion = direccion;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public boolean guardarEquipo() {
        boolean exito = false;
        ConexionBDgripv conexion = new ConexionBDgripv();
        if (conexion.setAutoCommitBD(false)) {
            boolean inserto = conexion.insertarBD("INSERT INTO equipos(idequipo,nombre,direccion,ubicacion) "
                    + " VALUES ('" + this.idequipo + "','" + this.nombre + "','" + this.direccion + "','" + this.ubicacion + "');  ");
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

    public boolean eliminarEquipo(String idequipo) {
        boolean exito = false;
        ConexionBDgripv conexion = new ConexionBDgripv();
        if (conexion.setAutoCommitBD(false)) {
//            String sql = "DELETE FROM `comentarios` WHERE `NoIdent`='"+NoIdent+"'";
//            boolean borro = conexion.borrarBD(sql);
            String sql2 = "DELETE FROM `equipos` WHERE `idequipo`='" + idequipo + "'";
            boolean borro2 = conexion.borrarBD(sql2);
            if (borro2) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        conexion.cerrarConexion();
        return exito;
    }

    public boolean actualizarEquipo() {
        boolean exito = false;
        ConexionBDgripv conexion = new ConexionBDgripv();
        if (conexion.setAutoCommitBD(false)) {
//UPDATE table_name
//SET column1=value1,column2=value2,...
//WHERE some_column=some_value;
            String sql2 = "UPDATE `equipos` SET nombre='" + this.nombre + "',direccion='" + this.direccion + "', ubicacion='" + this.ubicacion + "'"
                    + "WHERE `idequipo`='" + this.idequipo + "'";
            boolean borro2 = conexion.borrarBD(sql2);
            if (borro2) {
                conexion.commitBD();
                exito = true;
            } else {
                conexion.rollbackBD();
            }
        }
        conexion.cerrarConexion();
        return exito;
    }

    public Equipo getEquipo(String idequipo) throws SQLException {
        ConexionBDgripv conexion = new ConexionBDgripv();
        ResultSet rs = conexion.consultarBD("select * from equipos where  idequipo ='" + idequipo + "'");
        Equipo e = null;

        if (rs.next()) {
            e = new Equipo();
            e.setIdequipo(rs.getString("idequipo"));
            e.setNombre(rs.getString("nombre"));
            e.setDireccion(rs.getInt("direccion"));
            e.setUbicacion(rs.getString("ubicacion"));

        }
        conexion.cerrarConexion();
        return e;
    }

    public List<Equipo> getListaEquipos() throws SQLException {
        ConexionBDgripv conexion = new ConexionBDgripv();
        ResultSet rs = conexion.consultarBD("select * from equipos");
        List<Equipo> listaEquipos = new ArrayList<>();
        Equipo e = null;

        while (rs.next()) {
            e = new Equipo();
            e.setIdequipo(rs.getString("idequipo"));
            e.setNombre(rs.getString("nombre"));
            e.setDireccion(rs.getInt("direccion"));
            e.setUbicacion(rs.getString("ubicacion"));
            listaEquipos.add(e);
        }
        conexion.cerrarConexion();
        return listaEquipos;
    }

}
