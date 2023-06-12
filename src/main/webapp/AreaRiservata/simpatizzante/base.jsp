<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Simpatizzante</h1>
    <div>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/simpatizzante/dati_personali.jsp") %>">Utenti Registrati</a></h4>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/simpatizzante/iscrizione_attivita.jsp") %>">Iscrizione Attivita'</a></h4>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/simpatizzante/cancella_iscrizione.jsp") %>">Cancella Iscrizione</a></h4>
    </div>

    <!--pulsante logout-->
    <div class="logout">
        <form action="../../LogoutServlet" method="get">
            <button class="button" type="submit"> Logout </button>
        </form>
    </div>
</div>
