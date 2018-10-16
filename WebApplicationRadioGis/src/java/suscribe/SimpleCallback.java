/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package suscribe;

import javax.swing.JOptionPane;
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
        this.mss.getSuscriptor().setMensaje(mensaje);
    }
    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        // not used in this example
    }

}
