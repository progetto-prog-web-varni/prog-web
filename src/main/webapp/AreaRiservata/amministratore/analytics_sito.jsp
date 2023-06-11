<%@ page import="Utils.Database" %>
<%@ page contentType="text/html;charset=UTF-8" %>

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
    <%@ include file="../../Components/favicon_setting.jsp" %>

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
        <h1>Analytics Sito</h1>
        <button class="button" onclick="loadPagesData()">Carica dati</button>
        <div id="chartContainer" style="display: none;"></div>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>

</body>

<script>
    function createPageChart2(data){
        Highcharts.chart('chartContainer', {
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



    function loadPagesData() {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "../../PagesServlet", true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                let data = JSON.parse(xhr.responseText);
                console.log(data);
                createPageChart2(data);
                document.getElementById('chartContainer').style.display = 'block';
            } else if (xhr.readyState === 4) {
                alert("Errore durante la richiesta dei dati del database.");
            }
        };

        xhr.send();
    }
</script>

</html>