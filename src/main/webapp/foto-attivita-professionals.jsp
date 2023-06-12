<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="Components/favicon_setting.jsp" %>

    <style>
        @import './resources/css/base.css';
        @import './resources/css/header.css';
        @import './resources/css/footer.css';

        @import './resources/css/foto_attivita.css';
    </style>

    <title>Tum4World | Foto attività professionals </title>
    </head>

<body>
    <%@ include file="Components/header.jsp" %>

    <div class="container_foto">
        <div class="title">
            <br>
            <h2 class="attivita-title">Immagini Attività Tum4World for Professionals</h2>
        </div>

        <p class="description">
            Questa attività consiste in una serie di 15 lezioni incentrate sull'informatica applicata alla programmazione web e allo sviluppo di app mobile.<br>
            L'obiettivo del corso è la comprensione degli elementi di base della programmazione web con un focus iniziale sul front-end,
            ossia tutta la parte visibile all'utente di un programma e con cui egli può interagire, tipicamente un'interfaccia utente;
            e poi tutta la parte "invisibile" al visitatore: il back-end.<br>
            Con questo si intende, invece, tutta quella parte dietro le quinte del sito che permette l'effettivo funzionamento di queste interazioni.
            Si tratta quindi d'interagire con database, Servlet, gestione dei dati, sicurezza, ...<br>
            I linguaggi di programmazione affrontati saranno quindi html, css, javascript e java.<br>
            La programmazione web è, oggigiorno, molto importante e richiesta in ogni realtà lavorativa. <br>
            Quale azienda, grande o piccola che sia, non ha un sito web per farsi pubblicità o per vendere i propri prodotti online!<br>
            Se sei interessato a questi temi, questo è il corso giusto per te!<br><br>
            Qui sotto sono riportate altre immagini relative a questa attività:
        </p>

        <img class="img img1" src="${pageContext.request.contextPath}/resources/img/foto_attivita/professional5.jpeg"  alt="foto programmatore">
        <img class="img img2" src="${pageContext.request.contextPath}/resources/img/foto_attivita/professional2.jpeg"  alt="foto programmatore">
        <img class="img img3" src="${pageContext.request.contextPath}/resources/img/foto_attivita/professional6.jpeg"  alt="foto programmatore">
    </div>

    <%@ include file="Components/footer.jsp" %>
</body>

</html>
