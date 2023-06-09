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
        <%@ include file="resources/css/popup.css" %>
        <%@ include file="resources/css/contatti.css" %>
        <%@ include file="resources/css/cookies.css" %>
    </style>

    <title>Tum4World | Contatti</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.png">
</head>


<body>
    <%@ include file="Components/header.jsp" %>
        <div class="contatti-grid" id="pippo">
            <form class="contatti-grid-center" method="post" name="modulo" action="MailServlet" onsubmit="return validazioneEmail()" >
                <div class="contatti-info">
                    <h2>I NOSTRI CONTATTI:</h2>
                    <h4>Via Mazzini, 34 342 876 2213 </h4>
                </div>
                <div class="contatti-form-box">
                    <h2 class="margin-bottom-5">LA TUA RICHIESTA DI CONTATTO:</h2>
                    <div class="contatti-form-flex">
                        <label for="fname" class="margin-bottom-5">Nome</label>
                        <input class="contatti-form-input" type="text" id="fname" name="fname" placeholder="Mario">
                        <label for="lname" class="margin-bottom-5">Cognome</label>
                        <input class="contatti-form-input" type="text" id="lname" name="lname" placeholder="Rossi">
                        <label for="email" class="margin-bottom-5">Indirizzo Email</label>
                        <input class="contatti-form-input" type="text" id="email" name="email" placeholder="mario.rossi@gmail.com">
                    </div>
                    <h3 class="margin-bottom-5">Motivo di contatto</h3>
                    <div class="menu">
                        <div>
                            <input type="radio" id="assistenza" name="contact_reason" value="assistenza">
                            <label for="assistenza">Assistenza compilazione</label>
                        </div>
                        <div>
                            <input type="radio" id="info" name="contact_reason" value="Informazioni aggiuntive camp">
                            <label for="info">Informazioni aggiuntive camp</label>
                        </div>
                        <div>
                            <input type="radio" id="err" name="contact_reason" value="Errore iscrizione">
                            <label for="err">Errore nell'iscrizione</label>
                        </div>
                        <div>
                            <input type="radio" id="Disiscrizione" name="contact_reason" value="Disiscrizione">
                            <label for="Disiscrizione">Disiscrizione</label>
                        </div>
                        <div>
                            <input type="radio" id="altro" name="contact_reason" value="altro">
                            <label for="altro">Altro</label>
                        </div>
                    </div>
                    <h3 for="textarea"> Dettagli richiesta</h3>
                    <textarea placeholder="Inserisci qui il tuo testo" rows="6" cols="50" name="feedback"></textarea><br>
                    <small class="margin-bottom-5">Scrivi chiaramente quello che ti serve, così potremo aiutarti
                        meglio!</small>
                    <div class="final-button">
                        <input type="submit" value="Submit" class="button" id="submit_btn">      <!-- BOTTONE SUBMIT -->
                        <input type="reset" value="Reset" class="button" id="reset_btn" >    <!-- BOTTONE RESET -->
                    </div>
                </div>

                <div id="popup-danger" class="alert">
                    <span class="close" onclick="return nascondiPopup()">&times;</span>
                    <strong>Danger!</strong> Enter a valid mail!
                </div>

                <div id="popup-success" class="alert success">
                    <span class="close" onclick="return nascondiPopup()">&times;</span>
                    <strong>Success!</strong> Thank you for filling out the form!
                </div>

                <div id="popup-reset" class="alert info">
                    <span class="close" onclick="return nascondiPopup()">&times;</span>
                    <strong>Info:</strong> Reset is done!
                </div>

            </form>
        </div>

    <script>

        function validazioneEmail()
        {
            // recupero il valore della email indicata nel form
            let email = document.modulo.email.value;
            // se non ho inserito nulla nel campo
            if(email==''){
                visualizzaDanger();
                return false;
            }
            // verifico se è un indirizzo valido
            if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
                visualizzaSuccess();
            }
            else {
                visualizzaDanger();
                return false;
            }
            return true;
        }

        function visualizzaReset(){
            document.getElementById("popup-danger").style.display = "none";
            document.getElementById("popup-success").style.display = "none";
            document.getElementById("popup-reset").style.display = "block";
        }
        onsubmit="return validazioneEmail()"
        function visualizzaDanger(){
            document.getElementById("popup-danger").style.display = "block";
            document.getElementById("popup-success").style.display = "none";
            document.getElementById("popup-reset").style.display = "none";
        }

        function visualizzaSuccess(){
            document.getElementById("popup-danger").style.display = "none";
            document.getElementById("popup-success").style.display = "block";
            document.getElementById("popup-reset").style.display = "none";
        }

        function nascondiPopup(){
            document.getElementById("popup-danger").style.display = "none";
            document.getElementById("popup-success").style.display = "none";
            document.getElementById("popup-reset").style.display = "none";
        }
    </script>
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

        if (sessionStorage.getItem("cookiesAccettati") === "false") {
            cookieBanner.style.display = "none";
        }
    });

</script>

</html>