<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Check if login, se no redirect --%>

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

        <%@ include file="../../resources/css/area_riservata.css" %>

        <%@ include file="../../resources/css/simpatizzante.css" %>
    </style>

    <title>Tum4World | Area Riservata</title>
</head>


<body>
<%@ include file="../../Components/header.jsp" %>

<!-- BODY of web page -->
<div class="body-container">
    <%@ include file="base.jsp"%>
    <div>
        <h1 class="attivita-title margin-bottom-5">Dati Pesonali</h1>
        <h3 class="margin-bottom-5">Nome e Cognome: </h3>
        <h3 class="margin-bottom-5">Data di Nascita:  </h3>
        <h3 class="margin-bottom-5">Email: </h3>
        <h3 class="margin-bottom-5">Username: </h3>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>
</body>

</html>