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

    <title>Tum4World | Area Riservata</title>
</head>


<body>
<%@ include file="../../Components/header.jsp" %>

<!-- BODY of web page -->
<div class="body-container">
    <%@ include file="base.jsp"%>
    <div>
        <!-- Qui vanno tutti i dati dinamici in base a quello cliccato -->
        <h1 class="generic-text-center">Clicca una voce del menu per visualizzare i dati</h1>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>
</body>

</html>