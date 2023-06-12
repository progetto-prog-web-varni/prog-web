<%@ page contentType="text/html;charset=UTF-8" %>

<%-- Check if login, se no redirect --%>

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
        <!-- Qui vanno tutti i dati dinamici in base a quello cliccato -->
        <div>
            <h3 class="attivita-title">Cancella Iscrizioni</h3>
            <h4>Scelta tra le attività che vengono seguite</h4>
            <button class="button" onclick="cancellaIscrizioni()">Cancella Iscrizioni</button>
        </div>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>
</body>

<script>
    function cancellaIscrizioni() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Cancellazione avvenuta con successo
                    alert("Iscrizioni cancellate con successo");
                } else {
                    // Errore durante la cancellazione
                    alert("Si è verificato un errore durante la cancellazione delle iscrizioni");
                }
            }
        };
        xhr.open('POST', '../../UnsubscribeServlet', true);
        xhr.send();
    }
</script>

</html>