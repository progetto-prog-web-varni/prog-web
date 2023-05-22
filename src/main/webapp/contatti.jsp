<!DOCTYPE html>
<html>
<!-- HOME PAGE -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contatti.css">
    <title>Tum4World | HomePage</title>
</head>

<body>
    <jsp:include page="Components/header.jsp"></jsp:include>

    <div id="body">
        <div class="container-contatti">
            <form style="text-align:center">
                <p><strong>CONTATTI:</strong> via mazzini, 34 342 876 2213 </p>
                <label for="fname">Nome</label><br>
                <input class="myFormItem" type="text" id="fname" name="fname" placeholder="Mario"><br>
                <label for="lname">Cognome</label><br>
                <input class="myFormItem" type="text" id="lname" name="lname" placeholder="Rossi"><br>
                <label for="email">Indirizzo Email</label><br>
                <input class="myFormItem" type="text" id="email" name="email" placeholder="mario.rossi@gmail.com">

                <p style="margin-bottom:3px">Motivo di contatto</p>
                <div style="padding-left:26%; text-align:left;">
                    <input type="radio" id="assistenza" name="contact_reason" value="assistenza">
                    <label for="assistenza">Assistenza compilazione</label><br>
                    <input type="radio" id="info" name="contact_reason" value="info">
                    <label for="info">Informazioni aggiuntive camp</label><br>
                    <input type="radio" id="err" name="contact_reason" value="err">
                    <label for="err">Errore nell'iscrizione</label><br>
                    <input type="radio" id="Disiscrizione" name="contact_reason" value="Disiscrizione">
                    <label for="Disiscrizione">Disiscrizione</label><br>
                    <input type="radio" id="altro" name="contact_reason" value="altro">
                    <label for="altro">Altro</label><br><br>
                </div>
                <label for="textarea">Dettagli richiesta</label><br>
                <textarea id="textarea" placeholder="Inserisci qui il tuo testo" rows="6" cols="50"></textarea><br>
                <!--TODO: come mai non si vede il placeholder?? -->
                <small>Esempio: Richiedo contatto per informazioni tecniche riguardo modifica orari
                    incontro</small><br><br>
                <input type="submit" value="Submit">
                <input type="reset" value="Reset">
            </form>
        </div>
    </div>

    <jsp:include page="Components/footer.jsp"> </jsp:include>
</body>

</html>