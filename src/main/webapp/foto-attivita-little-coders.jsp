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
</head>

<body>
    <%@ include file="Components/header.jsp" %>
    <div class="container_foto">
        <div class="title">
            <br>
            <h2 class="attivita-title">Immagini Attività Tum4World for Little Coders</h2>
            <br>
        </div>

        <div class="centered img1">
            <img src="resources\img\foto_attivita\bambini1.jpg" alt="foto robot con bambino">
        </div>

        <div class="centered img2">
            <img src="resources\img\foto_attivita\bambini2.jpg"  alt="foto robot con bambino">
        </div>

        <div class="centered img3">
            <img src="resources\img\foto_attivita\bambini3.jpg"  alt="foto robot con bambino">
        </div>

    </div>

    <%@ include file="Components/footer.jsp" %>
</body>

</html>