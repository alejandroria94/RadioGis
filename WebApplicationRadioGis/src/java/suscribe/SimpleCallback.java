/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package suscribe;

import com.google.gson.JsonParser;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;

/**
 *
 * @author Fido
 */
public class SimpleCallback implements MqttCallback {

    MqttSubscriberSample mss;

    public SimpleCallback(MqttSubscriberSample mss) {
        this.mss = mss;
    }

    public SimpleCallback() {
    }

    @Override
    public void connectionLost(Throwable throwable) {
        System.out.println("Connection to MQTT broker lost!");
        this.mss.getSuscriptor().setConectado(false);
    }

    @Override
    public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
        String mensaje = new String(mqttMessage.getPayload());
        System.out.println("Message received:\n\t" + mensaje);
//        JOptionPane.showMessageDialog(null, mensaje);
        String tipo = new JsonParser().parse(mensaje).getAsJsonObject().get("tipo").getAsString();
        if(tipo.equals("rgb")){
        this.mss.getSuscriptor().setMensajeRgb(mensaje);
        }
        if(tipo.equals("humedad")){
        this.mss.getSuscriptor().setMensajeHumedad(mensaje);
        }
        if(tipo.equals("potenciometro")){
        this.mss.getSuscriptor().setMensajePotenciometro(mensaje);
        }
        if(tipo.equals("gas")){
        this.mss.getSuscriptor().setMensajeGas(mensaje);
        }
    }
    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        // not used in this example
    }

}
