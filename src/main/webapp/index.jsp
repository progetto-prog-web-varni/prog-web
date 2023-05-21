<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<!-- HOME PAGE -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300&display=swap" rel="stylesheet">
    <title>Tum4World | HomePage</title>
</head>


<body>

<%@ include file="Components/header.jsp" %>

<!-- BODY of web page -->
<div class="container">
    <div class="body-item">
        <figure>
            <img class="img-descrizione"
                 src="https://wips.plug.it/cips/tecnologia/cms/2017/11/sicurezza-informatica-2018.jpg" />
            <figcaption>
                <p>Innovation to improve your life</p>
            </figcaption>
        </figure>
    </div>
    <div class="body-item">
        <h2 class="h2-descrizione">Descrizione dell'attività.</h2>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
            took a galley of type and scrambled it to make a type specimen book. It has survived not only five
            centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was
            popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more
            recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </p>
        <div>
            <button class="button">SCARICA VOLANTINO</button>
        </div>
    </div>
</div>

<%@ include file="Components/footer.jsp" %>

</body>

</html>
