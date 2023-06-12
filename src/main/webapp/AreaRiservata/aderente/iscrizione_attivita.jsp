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

        <%@ include file="../../resources/css/aderente.css" %>
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
        <h3 class="margin-bottom-5 attivita-title"></h3>
        <h1>Lista delle attivita' possibili</h1>

        <button class="button margin-bottom-5" onclick="loadOnClick()">Carica Dati</button>

        <form action="../../ServletAttivita" id="formAction" method="POST">
            <div class="alert" id="alert-div" hidden>
                <span class="close" onclick="hidePopup()">&times;</span>
                <span><strong>Errore!</strong>Errore nell'immissione dei parametri</span>
            </div>

        </form>

    </div>
</div>

<script>
    const errorBox = document.getElementById("alert-div");

    const loadOnClick = () => {

        // style della checkbox
        const checkBox = "";
        // <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike" checked>
        // <label for="vehicle1"> I have a bike</label><br>
        const formAction = document.getElementById("formAction");

        let occupato = false;

        try {
            let xhr = new XMLHttpRequest();
            xhr.open('GET', '../../ServletAttivita', true);
            xhr.onreadystatechange = () => {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if(xhr.status === 200){
                        const resp = JSON.parse(xhr.responseText);
                        console.log(resp);
                        if (!occupato) {
                            occupato = true;
                            for(let i=0; i<resp["activities"].length; i++) {

                                let actCheck = "";
                                if (resp["activities"][i]["bool"]) actCheck = "checked";

                                const checkbox = "<input type='checkbox' id='attivita1' name='"
                                    + resp["activities"][i]["name"] + "' value='true' " + actCheck + ">"
                                    + "<label for='" + resp["activities"][i]["name"] + "'>" + resp["activities"][i]["name"] + "</label><br>";
                                formAction.innerHTML += checkbox;
                            }

                            const checkbox = "<input class='button' type='submit' id='sendForm' name='submit' value='Iscriviti alle attività'>";
                            formAction.innerHTML += checkbox;
                        }
                    } else {
                        console.log(xhr.responseText);
                        const resp = xhr.responseText;
                        errorBox.innerText = resp["message"];
                        activeErrorBanner();
                    }
                }

            }
            xhr.send();

        } catch (e) {
            errorBox.innerText = "Err. 13: " + e;
            activeErrorBanner();
            console.log("Errore nella XML");
        }
    }

    const activeErrorBanner = () => errorBox.style.display = "block";

    const hidePopup = () => errorBox.style.display = "none";


</script>

<%@ include file="../../Components/footer.jsp" %>
</body>

</html>