<!-- Components for lateral navbar -->

<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Amministratore</h1>
    <div>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/amministratore/utenti_registrati.jsp;jsessionid=<%= session.getId() %>">Utenti Registrati</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/amministratore/simpatizzanti_registrati.jsp;jsessionid=<%= session.getId() %>">Simpatizzanti Registrati</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/amministratore/aderenti_registrati.jsp;jsessionid=<%= session.getId() %>">Aderenti Registrati</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/amministratore/analytics_sito.jsp;jsessionid=<%= session.getId() %>">Analytics Pagine</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/amministratore/analytics_donazioni.jsp;jsessionid=<%= session.getId() %>">Analytics Donazioni</a></h4>
    </div>
</div>