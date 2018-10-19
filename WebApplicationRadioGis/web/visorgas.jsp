<%-- 
    Document   : visorDemo
    Created on : 6/06/2018, 02:52:20 PM
    Author     : Fido
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
        <title>Gas</title>
    </head>

    <body>
        <!--menu-->
        <jsp:include page="menu.jsp"/>

        <!--contenido de la pagina-->
        <script src="js/highcharts.js"></script>
        <script src="js/exporting.js"></script>
        <script src="js/export-data.js"></script>
        <!--        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
        <!--<script src="https://code.highcharts.com/highcharts.js"></script>-->
        <!--<script src="https://code.highcharts.com/modules/exporting.js"></script>-->
        <!--<script src="https://code.highcharts.com/modules/export-data.js"></script>-->

        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


        <script>

            Highcharts.chart('container', {
                chart: {
                    type: 'spline',
                    animation: Highcharts.svg, // don't animate in old IE
                    marginRight: 10,
                    events: {
                        load: function () {
                            // set up the updating of the chart each second
                            var series = this.series[0];
                            setInterval(function () {

                                $.ajax({
                                    url: "peticiones.jsp",
                                    type: 'POST',
                                    data: {
                                        proceso: "mensajegas"
                                    },
                                    success: function (data) {
                                        if (data.ok === true) {
                                            var x = (new Date()).getTime(), // current time
                                                    y = parseFloat(data.mensajegas.valor);
                                            series.addPoint([x, y], true, true);
                                        } else {
                                            alert(data.errorMsg);
                                        }
                                    }
                                });
                                //

                            }, 1000);
                        }
                    }
                },
                time: {
                    useUTC: false
                },
                title: {
                    text: 'Live random data'
                },
                xAxis: {
                    type: 'datetime',
                    tickPixelInterval: 150
                },
                yAxis: {
                    title: {
                        text: 'Value'
                    },
                    plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br/>',
                    pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
                },
                legend: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                },
                series: [{
                        name: 'Random data',
                        data: (function () {
                            // generate an array of random data
                            var data = [],
                                    time = (new Date()).getTime(),
                                    i;

                            for (i = -19; i <= 0; i += 1) {
                                data.push({
                                    x: time + i * 1000,
                                    y: Math.random()
                                });
                            }
                            return data;
                        }())
                    }]
            });
        </script>
        <!--fin del contenido de la pagina-->

        <!--footer-->
        <jsp:include page="foot.jsp"/>
    </body>
</html>