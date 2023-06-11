<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Amministratore</h1>
    <div>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/amministratore/utenti_registrati.jsp") %>">Utenti Registrati</a></h4>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/amministratore/simpatizzanti_registrati.jsp") %>">Simpatizzanti Registrati</a></h4>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/amministratore/aderenti_registrati.jsp") %>">Aderenti Registrati</a></h4>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/amministratore/analytics_sito.jsp") %>">Analytics Pagine</a></h4>
        <h4><a href="<%= response.encodeURL(request.getContextPath() + "/AreaRiservata/amministratore/analytics_donazioni.jsp") %>">Analytics Donazioni</a></h4>
    </div>


    <!--pulsante logout-->
    <div class="logout">
        <form action="../../LogoutServlet" method="get">
            <button class="button "type="submit"> Logout </button>
        </form>
    </div>
</div>
