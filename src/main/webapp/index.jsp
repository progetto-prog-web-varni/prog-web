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
        </style>


        <title>Tum4World | HomePage</title>
    </head>


    <body>
        <%@ include file="Components/header.jsp" %>
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
                    <p>Tum4World è una associazione con più di 15 anni di esperienza nel settore
                        informatico, con l'obiettivo di rendere la programmazione alla portata di tutti completamente
                        gratis! <br>
                        Con i corsi offerti da noi puoi partire da zero e acquisire tutte le competenze necessarie per
                        diventare un professionista indispensabile per qualsiasi azienda. <br>
                        Vengono mensilmente proposte attività formative per ragazzi dalla scuola elementare alla
                        superiore, stage di formazione per studenti universitari, corsi di specializzazione per
                        lavoratori e lezioni di avvicinamento all'informatica anche per gli anziani!<br>
                        Sono previste lezioni on-demand, incontri con moltissime aziende del settore e una miriade di
                        attività di gruppo guidati da professionisti della formazione, da professori universitari e dal
                        nostro team di collaboratori.<br>
                        Oltre 5000 studenti, 3000+ lavoratori e stagisti, più di 1000 anziani si sono affidati a noi,
                        creando una community bellissima fonte di ispirazione per moltissime realtà formative e
                        lavorative.<br>
                        Che aspetti, unisciti anche tu!<br>
                    </p>
                    <div>
                        <button class="button">SCARICA VOLANTINO</button>
                    </div>
                </div>
            </div>
            <%@ include file="Components/footer.jsp" %>
    </body>

    </html>