<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import './resources/css/base.css';
        @import './resources/css/header.css';
        @import './resources/css/footer.css';
        @import './resources/css/foto_attivita.css';
    </style>

    <title>Tum4World | Foto attività seniors </title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.png">
</head>

<body>
    <%@ include file="Components/header.jsp" %>

    <div class="container_foto">
        <div class="title">
            <br>
            <h2 class="attivita-title">Immagini Attività Tum4World for Seniors</h2>
        </div>

        <p class="description">
            L'obiettivo di questo corso è quello di dare conoscenze e competenze di base alle persone più anziane
            (over 65) in modo da renderli indipendenti e consapevoli al 100% dello strumento e dei tool più utilizzati
            nel web e nel loro personal Computer. <br>
            Questo corso prevede dalle 5 alle 8 lezioni individuali o in piccoli gruppetti ove il soggetto sarà seguito individualmente in ogni singolo passaggio.<br>
            Alla prima lezione verrà analizzato il dispositivo mobile più utilizzato: il telefono, per poi passare al computer e, infine, anche ipad o tablet.<br><br>
            Qui sotto sono riportate altre immagini relative a questa attività:
        </p>

        <img class="img img1" src="${pageContext.request.contextPath}/resources/img/foto_attivita/anziani1.jpg" alt="foto anziani">
        <img class="img img2" src="${pageContext.request.contextPath}/resources/img/foto_attivita/anziani2.jpg"  alt="foto anziani">
        <img class="img img3" src="${pageContext.request.contextPath}/resources/img/foto_attivita/anziani3.jpg"  alt="foto anziani">

    </div>

    <%@ include file="Components/footer.jsp" %>
</body>

</html>
