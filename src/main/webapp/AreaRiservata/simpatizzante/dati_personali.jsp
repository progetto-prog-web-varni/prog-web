<%@ page contentType="text/html;charset=UTF-8" %>

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
        <button class="button" onclick="toggleInfo()">Visualizza Informazioni</button>
        <div id="infoContainer" style="display: none;">
            <h3><strong>Nome:</strong> <span id="name"></span></h3>
            <h3><strong>Cognome:</strong> <span id="surname"></span></h3>
            <h3><strong>Data di Nascita:</strong> <span id="birthdate"></span></h3>
            <h3><strong>Email:</strong> <span id="email"></span></h3>
            <h3><strong>Phone:</strong> <span id="phone"></span></h3>
            <h3><strong>Username:</strong> <span id="username"></span></h3>
        </div>
    </div>
</div>

<%@ include file="../../Components/footer.jsp" %>

<script>
    function toggleInfo() {
        var infoContainer = document.getElementById('infoContainer');
        var button = document.querySelector('.button');

        if (infoContainer.style.display === 'none') {
            button.textContent = 'Nascondi Informazioni';
            infoContainer.style.display = 'block';
            retrieveInfo();
        } else {
            button.textContent = 'Visualizza Informazioni';
            infoContainer.style.display = 'none';
        }
    }

    function displayInfo(info) {
        document.getElementById('name').textContent = info.name;
        document.getElementById('surname').textContent = info.surname;
        document.getElementById('birthdate').textContent = info.birthdate;
        document.getElementById('email').textContent = info.email;
        document.getElementById('phone').textContent = info.phone;
        document.getElementById('username').textContent = info.username;
    }

    function retrieveInfo() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var info = JSON.parse(xhr.responseText);
                    displayInfo(info);
                } else {
                    console.error('Errore durante la richiesta AJAX');
                }
            }
        };
        xhr.open('GET', '../../RetrieveInfoServlet', true);
        xhr.send();
    }
</script>

</body>
</html>
