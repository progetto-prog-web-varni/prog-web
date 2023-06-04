<%@ page import="Utils.HitsCounter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Check if login, se no redirect --%>
<%-- Check che tipo di utente è --%>
<%-- Intanto utilizzo un http params (?value=1/2/3), poi si dovranno controllare le role --%>

<!DOCTYPE html>
<html>
<!-- HOME PAGE -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        <%@ include file="../../resources/css/base.css" %>
        <%@ include file="../../resources/css/footer.css" %>
        <%@ include file="../../resources/css/header.css" %>
        <%@ include file="../../resources/css/cookies.css" %>

        <%@ include file="../../resources/css/area_riservata.css" %>

        <%@ include file="../../resources/css/amministratore.css" %>
    </style>

    <script src="https://code.highcharts.com/highcharts.js"></script>

    <title>Tum4World | Area Riservata</title>
</head>


<body>
<%@ include file="../../Components/header.jsp" %>

<!-- BODY of web page -->
<div class="body-container">
    <%@ include file="base.jsp"%>
    <div>
        <!-- Qui vanno tutti i dati dinamici in base a quello cliccato -->
        <h1>Analytics sito</h1>
        <%
            out.println(HitsCounter.returnAllCounter());
        %>
        <button onclick="loadPageData()">Carica dati</button>
        <div id="pageChartContainer" style="display: none;"></div>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>

<%
    String testData = "[[\"Home\", 10], [\"About\", 5], [\"Contact\", 8]]";
%>
</body>

<script>
    function createPageChart2(data){
        Highcharts.chart('pageChartContainer', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Contatori dei dati'
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Hits'
                }
            },
            series: [{
                name: 'Hits',
                data: data
            }]
        });
    }



    function loadPageData(){
        var data = <%= testData %>;
        console.log(data)
        createPageChart2(data);
        document.getElementById('pageChartContainer').style.display = 'block';
    }
</script>

</html>