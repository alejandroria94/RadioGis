/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import beans.gripv.Lectura;
import beans.gripv.Variable;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.tomcat.util.descriptor.tld.TldRuleSet;

/**
 *
 * @author Fido
 */
public class Demo {

    public static void main(String[] args) throws SQLException, IOException {
//        List<Variable> listaVariables = new ArrayList<>();
//        listaVariables.add(new Variable("nombre", "numeroRegistro", "conversion", "valor", "tipo"));
//        listaVariables.add(new Variable("nombre1", "numeroRegistro1", "conversion1", "valor1", "tipo1"));
//        listaVariables.add(new Variable("nombre1", "numeroRegistro2", "conversion2", "valor2", "tipo2"));
//        Lectura l = new Lectura();
//        l.setEquipos_idequipo("equipos_idequipo");
//        l.setFecha("fecha");
//        l.setIdlectura(0);
//        l.setListaVariables(listaVariables);
//        System.out.println(new Gson().toJson(l));
//        Lectura l1 = new Gson().fromJson(new Gson().toJson(l), Lectura.class);
//        System.out.println("");
        String a = ConnectToUrlUsingBasicAuthentication.getData(ConnectToUrlUsingBasicAuthentication.URL2);
        System.out.println("");
    }
}
