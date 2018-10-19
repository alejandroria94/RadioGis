<%-- 
    Document   : visorDemo
    Created on : 6/06/2018, 02:52:20 PM
    Author     : Fido
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="beans.ConnectToUrlUsingBasicAuthentication"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
        <title>Visor </title>

        <style>
            #container {
                min-width: 310px;
                max-width: 800px;
                height: 400px;
                margin: 0 auto
            }

        </style>
    </head>

    <body>
        <!--menu-->
        <jsp:include page="menu.jsp"/>

        <!--contenido de la pagina-->
        <script src="js/highcharts.js"></script>
        <script src="js/exporting.js"></script>
        <script src="js/export-data.js"></script>
        <script src="js/series-label.js"></script>

        <!--        <div id="container"></div>
        
                <script>
                    Highcharts.chart('container', {
                        title: {
                            text: 'Solar Employment Growth by Sector, 2010-2016'
                        },
                        subtitle: {
                            text: 'Source: thesolarfoundation.com'
                        },
                        yAxis: {
                            title: {
                                text: 'Number of Employees'
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'middle'
                        },
                        plotOptions: {
                            series: {
                                label: {
                                    connectorAllowed: false
                                },
                                pointStart: 2010
                            }
                        },
                        series: [{
                                name: 'Installation',
                                data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
                            }, {
                                name: 'Manufacturing',
                                data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
                            }, {
                                name: 'Sales & Distribution',
                                data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
                            }, {
                                name: 'Project Development',
                                data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
                            }, {
                                name: 'Other',
                                data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
                            }],
                        responsive: {
                            rules: [{
                                    condition: {
                                        maxWidth: 500
                                    },
                                    chartOptions: {
                                        legend: {
                                            layout: 'horizontal',
                                            align: 'center',
                                            verticalAlign: 'bottom'
                                        }
                                    }
                                }]
                        }
        
                    });
                </script>-->

        <div class = "col s12 m12 l12 contenidoP">

        </div>

        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>time</th>
                    <th>data</th>
                </tr>
            </thead>

            <tbody>
                <%
                    try {
                        String a = ConnectToUrlUsingBasicAuthentication.getData(ConnectToUrlUsingBasicAuthentication.URL2);
                        JsonObject jo = new JsonParser().parse(a).getAsJsonObject();
                        Date d;
                        DateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                %>
                <%
                    int i = 1;
                    for (JsonElement x : jo.getAsJsonArray("data")) {
                        d = new Date(Long.parseLong(x.getAsJsonObject().get("time").toString()) * 1000);
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=f.format(d)%></td>
                    <td><%=x.getAsJsonObject().get("data")%></td>
                </tr>
                <%
                        i++;
                    }
                %>

            </tbody>
        </table>
        <script>
            var datos =<%=a%>;
        </script>

        <%
            } catch (Exception e) {
            }
        %>



        <style>
            #map{
                height:400px;
                width:100%;
            }
        </style>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <div id="map"></div>
        <script>
            function initMap() {
                // Map options
                var options = {
                    zoom: 13,
                    center: {lat: 7.1149349, lng: -73.1078267}
                };

                // New map
                var map = new google.maps.Map(document.getElementById('map'), options);

                // Listen for click on map
                google.maps.event.addListener(map, 'click', function (event) {
                    // Add marker
                    addMarker({coords: event.latLng});
                });


                // Add marker
                var marker = new google.maps.Marker({
                    position: {lat: 7.1149349, lng: -73.1107119},
                    map: map,
                    icon: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
                });

                var infoWindow = new google.maps.InfoWindow({
                    content: '<h1><a href="#">hi</a></h1>'
                });

                marker.addListener('click', function () {
                    infoWindow.open(map, marker);
                });


//                    // Array of markers
//
//                    var markers = [];
//                    var obj = {};
//                    var obj1 = {};
//                    obj1["lat"]='7.0';
//                    obj1["lng"]='-70.0';
//                    obj["coords"] = obj1;
//                    obj["content"] = '<h1><a href="#">hi</a></h1>';
//                    markers.push(obj);

                // Loop through markers
                for (var i = 0; i < markers.length; i++) {
                    // Add marker
                    addMarker(markers[i]);
                }

                // Add Marker Function
                function addMarker(props) {
                    var marker = new google.maps.Marker({
                        position: props.coords,
                        map: map
                                //icon:props.iconImage
                    });

                    // Check for customicon
                    if (props.iconImage) {
                        // Set icon image
                        marker.setIcon(props.iconImage);
                    }

                    // Check content
                    if (props.content) {
                        var infoWindow = new google.maps.InfoWindow({
                            content: props.content
                        });

                        marker.addListener('click', function () {
                            infoWindow.open(map, marker);
                        });
                    }
                }
            }
        </script>

        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDs65kMNObSGQtLBHceu2U_1EEhwlqGE5M&callback=initMap">
        </script>	


        <!--fin del contenido de la pagina-->

        <!--footer-->
        <jsp:include page="foot.jsp"/>
    </body>
</html>