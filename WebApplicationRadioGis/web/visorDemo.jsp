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
        <title>bosquesBancosCo2</title>
    </head>

    <body>
        <!--menu-->
        <jsp:include page="menu.jsp"/>

        <!--contenido de la pagina-->
        <script src="js/highcharts.js"></script>
        <script src="js/exporting.js"></script>
        <script src="js/export-data.js"></script>

        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        <script>
            $.getJSON(
            'temporal/usdeur.json',
                    function (data) {
                    Highcharts.chart('container', {
                    chart: {
                    zoomType: 'x'
                    },
                            title: {
                            text: 'Frecuencia sobre el tiempo'
                            },
                            subtitle: {
                            text: document.ontouchstart === undefined ?
                                    'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
                            },
                            xAxis: {
                            type: 'datetime'
                            },
                            yAxis: {
                            title: {
                            text: 'Exchange rate'
                            }
                            },
                            legend: {
                            enabled: false
                            },
                            plotOptions: {
                            area: {
                            fillColor: {
                            linearGradient: {
                            x1: 0,
                                    y1: 0,
                                    x2: 0,
                                    y2: 1
                            },
                                    stops: [
                                    [0, Highcharts.getOptions().colors[0]],
                                    [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                                    ]
                            },
                                    marker: {
                                    radius: 2
                                    },
                                    lineWidth: 1,
                                    states: {
                                    hover: {
                                    lineWidth: 1
                                    }
                                    },
                                    threshold: null
                            }
                            },
                            series: [{
                            type: 'area',
                                    name: 'USD to EUR',
                                    data: data
                            }]
                    });
                    }
            );
        </script>

        <!--fin del contenido de la pagina-->

        <!--footer-->
        <jsp:include page="foot.jsp"/>
    </body>
</html>