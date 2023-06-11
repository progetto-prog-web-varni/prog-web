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
        <h3>Visualizza Utenti Registrati</h3>
        <button class="button" onclick="retrieveRegistrati()">Visualizza Registrati</button>
        <div id="results3"></div>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>
</body>
<script>
    function retrieveRegistrati() {
        let xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    let data = JSON.parse(xhr.responseText);
                    displayDataRegistrati(data);
                } else {
                    console.error('Errore durante la richiesta AJAX');
                }
            }
        };
        xhr.open('GET', '../../RetrieveRegistratiServlet', true);
        xhr.send();
    }


    function displayDataRegistrati(data) {
        const resultsDiv = document.getElementById('results3');
        resultsDiv.innerHTML = '';

        for (let i = 0; i < data.length; i++) {
            let entry = data[i];
            let name = entry[0];
            let surname = entry[1];

            let resultRow = document.createElement('div');
            resultRow.textContent = name + ' ' + surname;
            resultsDiv.appendChild(resultRow);
        }

        resultsDiv.style.overflow = 'auto';
        resultsDiv.style.maxHeight = '150px';
    }
</script>
</html>