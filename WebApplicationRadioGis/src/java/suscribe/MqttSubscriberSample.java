/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package suscribe;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;

public class MqttSubscriberSample {

//    private JFramePrincipal ventana;
    private static MqttSubscriberSample instance = null;
    private SimpleCallback scbCallback;
    private static Suscriptor suscriptor;

    protected MqttSubscriberSample() {
        // Exists only to defeat instantiation.
    }

    public static MqttSubscriberSample getInstance() {
        if (instance == null) {
            instance = new MqttSubscriberSample();
            suscriptor = new Suscriptor();
        }
        return instance;
    }

    public Suscriptor getSuscriptor() {
        return suscriptor;
    }

    public void iniciar() {
        this.scbCallback = new SimpleCallback(this);
        String topic = "UIS/LP210";
//        String broker = "tcp://10.6.101.139:1883";
        String broker = "tcp://broker.hivemq.com:1883";
//        String broker = "tcp://10.1.50.42:1883";
        String clientId = "prototipo_inhibidor";
//        char[] password = {'R', 'I', 'o', 'T', 'm', 'o', 'd', 'e', 'l'};
        try {
            System.out.println("conectando...");
            MqttClient client = new MqttClient(broker, clientId);
//            client.setCallback(new SimpleCallback());
            client.setCallback(this.scbCallback);
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);
//            connOpts.setPassword(password);
            connOpts.setUserName(clientId);
            client.connect(connOpts);
            client.subscribe(topic);
            System.out.println("conectado");
            this.getSuscriptor().setConectado(true);
        } catch (MqttException me) {
            System.out.println("reason " + me.getReasonCode());
            System.out.println("msg " + me.getMessage());
            System.out.println("loc " + me.getLocalizedMessage());
            System.out.println("except " + me);
        }

    }
}