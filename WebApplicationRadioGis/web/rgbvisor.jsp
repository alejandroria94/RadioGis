<%-- 
    Document   : menu
    Created on : 1/06/2018, 01:36:17 AM
    Author     : fidolinux
--%>

<%@page import="suscribe.MqttSubscriberSample"%>
<%@page import="beans.gripv.URLConnectionReader"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
        <script src="js/highcharts.js"></script>
        <script src="js/series-label.js"></script>
        <script src="js/exporting.js"></script>
        <script src="js/export-data.js"></script>
        <title>rgbvisor</title>
        <style>
            #container {
                min-width: 310px;
                max-width: 80%;
                height: 400px;
                margin: 0 auto
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
    <center>
        <div>
            <h1 id="contenido" style="padding-top: 60px"></h1>
        </div>
        <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
    </center>

    <jsp:include page="foot.jsp"/>


    <script>
        // Radialize the colors
        Highcharts.setOptions({
            colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
                return {
                    radialGradient: {
                        cx: 0.5,
                        cy: 0.3,
                        r: 0.7
                    },
                    stops: [
                        [0, color],
                        [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                    ]
                };
            })
        });

        $(document).ready(function () {
            setInterval(function () {

                $.ajax({
                    url: "peticiones.jsp",
                    type: 'POST',
                    data: {
                        proceso: "mensajergb"
                    },
                    success: function (data) {
                        if (data.ok === true) {
//                            alert(data.mensajergb);
                            $('#contenido').text("{red:" + data.mensajergb.red + ",green:" + data.mensajergb.green + ",blue: " + data.mensajergb.blue + "}");
                            $('#contenido').css('background', 'rgb(' + data.mensajergb.red + ',' + data.mensajergb.green + ',' + data.mensajergb.blue + ')');
                            var  red=data.mensajergb.red;
                            var green=data.mensajergb.green;
                            var blue=data.mensajergb.blue;
                            // Build the chart
                            Highcharts.chart('container', {
                                chart: {
                                    plotBackgroundColor: null,
                                    plotBorderWidth: null,
                                    plotShadow: false,
                                    type: 'pie'
                                },
                                title: {
                                    text: 'Porcentajes de color'
                                },
                                tooltip: {
                                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                },
                                plotOptions: {
                                    pie: {
                                        allowPointSelect: true,
                                        cursor: 'pointer',
                                        dataLabels: {
                                            enabled: true,
                                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                            style: {
                                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                            },
                                            connectorColor: 'silver'
                                        }
                                    }
                                },
                                series: [{
                                        name: 'Share',
                                        data: [
                                            {name: 'Blue', y: parseFloat(blue)},
                                            {name: 'Red', y: parseFloat(red)},
                                            {name: 'Green', y: parseFloat(green)}
                                        ]
                                    }]
                            });


                        } else {
                            alert(data.errorMsg);
                        }
                    }
                });
//

            }, 3000);
        });
    </script>

</body>
</html>
