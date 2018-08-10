/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.apache.commons.codec.binary.Base64;

public class ConnectToUrlUsingBasicAuthentication {

    public static String getData() throws IOException {
        String result = "";
        String datos = "";
        String webPage = "https://backend.sigfox.com/api/devices/1CB377/messages?before=1533850009";
        String name = "5b5b3bdf5005746298eae733";
        String password = "8db98aeeada8f1d3490bf215a74dbc59";

        String authString = name + ":" + password;
        byte[] authEncBytes = Base64.encodeBase64(authString.getBytes());
        String authStringEnc = new String(authEncBytes);

        URL url = new URL(webPage);
        URLConnection urlConnection = url.openConnection();
        urlConnection.setRequestProperty("Authorization", "Basic " + authStringEnc);
        try (BufferedReader in = new BufferedReader(new InputStreamReader(
                urlConnection.getInputStream()))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                System.out.println(inputLine);
                datos += inputLine;
            }
        }
        result = datos;
        return result;
    }

}
