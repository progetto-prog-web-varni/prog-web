<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Simpatizzante</h1>
    <div>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/simpatizzante/dati_personali.jsp">Visualizza Dati Personali</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/simpatizzante/iscrizione_attivita.jsp">Iscrizione Attivita' dell'associazione</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/simpatizzante/cancella_iscrizione.jsp">Cancella Iscrizione Al sito</a></h4>
    </div>

    <!--pulsante logout-->
    <div class="logout">
        <form action="../../LogoutServlet" method="get">
            <button class="button "type="submit"> Logout </button>
        </form>
    </div>
</div>
