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
<%@page import="beans.URLConnectionReader"%>
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
                    <th>id</th>
                    <th>device</th>
                    <th>time</th>
                    <th>data</th>
                    <th>linkQuality</th>
                    <th>seqNumber</th>
                    <th>rinfos</th>
                </tr>
            </thead>

            <tbody>
                <%
                    try {
                        String a = ConnectToUrlUsingBasicAuthentication.getData();
                        JsonObject jo = new JsonParser().parse(a).getAsJsonObject();
                        Date d;
                        DateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                %>
                <%=jo.getAsJsonArray("data").size()%>
            <%
                int i = 1;
                for (JsonElement x : jo.getAsJsonArray("data")) {
                    d = new Date(Long.parseLong(x.getAsJsonObject().get("time").toString()) * 1000);
            %>
            <tr>
                <td><%=i%></td>
                <td><%=x.getAsJsonObject().get("device")%></td>
                <td><%=f.format(d)%></td>
                <td><%=x.getAsJsonObject().get("data")%></td>
                <td><%=x.getAsJsonObject().get("linkQuality")%></td>
                <td><%=x.getAsJsonObject().get("seqNumber")%></td>
                <td><%=x.getAsJsonObject().get("rinfos")%></td>
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




    <!--fin del contenido de la pagina-->

    <!--footer-->
    <jsp:include page="foot.jsp"/>
</body>
</html>