/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Fido
 */
import java.net.*;
import java.io.*;

public class URLConnectionReader {

    public static String URL1 = "https://api.enphaseenergy.com/api/v2/systems/752668/energy_lifetime?key=77160fa246179049b64391520f7dc1cd&user_id=4e5459324e7a4d300a";

    public static String getdata(String url) throws Exception {
        String datos = "";
        URL oracle = new URL(url);
        URLConnection yc = oracle.openConnection();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(
                yc.getInputStream()))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                System.out.println(inputLine);
                datos += inputLine;
            }
        }
        return datos;
    }

}
