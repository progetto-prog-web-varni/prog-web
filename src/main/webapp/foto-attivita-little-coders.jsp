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

    <title>Tum4World | Foto attività little coders</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.png">
</head>

<body>
    <%@ include file="Components/header.jsp" %>
    <div class="container_foto">
        <div class="title">
            <br>
            <h2 class="attivita-title">Immagini Attività Tum4World for Little Coders</h2>
            <br>
        </div>

        <p class="description">
            Il corso prevede una decina di lezioni e altrettanti laboratori, ove, a partire dagli elementi di base di elettronica, robotica, automazione e informatica, il soggetto sarà in grado di costruire il suo primo rover dotato di sensoristica di base.<br>
            L'obiettivo del corso è la costruzione di un robot simile a una macchina che, controllato tramite relativo radiocomando, sia in grado di superare una serie di ostacoli e sfide di vario tipo.<br>
            Non serve nessuna competenza di base per parteciparvi, solo voglia d'imparare e di mettersi in gioco!<br>
            Al termine dell'esperienza, è prevista una competizione tra i diversi partecipanti organizzati in gruppetti, sfidando i loro rover in competizioni accattivanti!<br>
            Per tutto questo percorso formativo, sarete seguiti dal professor Xamp Jiulin, professore dell'università di Trento esperto di robotica e di applicazioni industriali.<br><br><br>
            Qui sotto sono riportate altre immagini relative a questa attività:
        </p>

        <img class="img img1" src="${pageContext.request.contextPath}/resources/img/foto_attivita/bambini1.jpg" alt="foto robot con bambino">
        <img class="img img2" src="${pageContext.request.contextPath}/resources/img/foto_attivita/bambini2.jpg"  alt="foto robot con bambino">
        <img class="img img3" src="${pageContext.request.contextPath}/resources/img/foto_attivita/bambini3.jpg"  alt="foto robot con bambino">

    </div>

    <%@ include file="Components/footer.jsp" %>
</body>

</html>