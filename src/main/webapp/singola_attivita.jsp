<!-- Pagina per la singola attivita'-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<!-- HOME PAGE -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        <%@ include file="resources/css/base.css" %>
        <%@ include file="resources/css/footer.css" %>
        <%@ include file="resources/css/header.css" %>
        <%@ include file="resources/css/index.css" %>
        <%@ include file="resources/css/cookies.css" %>

    </style>
    <title>Tum4World | HomePage</title>
</head>

<body>
    <%@ include file="Components/header.jsp" %>
        <h1>Pagina Singola attivita'</h1>    
    <%@ include file="Components/footer.jsp" %>
</body>

<script>

    document.addEventListener("DOMContentLoaded", function() {
        var acceptBtn = document.getElementById("accept-btn");
        var rejectBtn = document.getElementById("reject-btn");
        var cookieBanner = document.getElementById("cookie-banner");

        acceptBtn.addEventListener("click", function() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "CookieServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    cookieBanner.style.display = "none";
                    sessionStorage.setItem("cookiesAccettati", "true");
                }
            };
            xhr.send();
        });

        rejectBtn.addEventListener("click", function() {
            cookieBanner.style.display = "none";
            sessionStorage.setItem("cookiesAccettati", "false");
        });

        // Controlla la scelta dei cookie al caricamento della pagina
        if (sessionStorage.getItem("cookiesAccettati") === "false") {
            cookieBanner.style.display = "none";
        }
    });

</script>
</html>