<!-- Components for lateral navbar -->

<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Aderente</h1>
    <div>

        <h4><a href="<% response.encodeURL(request.getContextPath() + "/AreaRiservata/aderente/dati_personali.jsp"); %>">Visualizza Dati Personali</a></h4>
        <h4><a href="<% response.encodeURL(request.getContextPath() + "/AreaRiservata/aderente/iscrizione_attivita.jsp"); %>">Visualizza Dati Personali</a></h4>
        <h4><a href="<% response.encodeURL(request.getContextPath() + "/AreaRiservata/aderente/cancella_iscrizione.jsp"); %>">Visualizza Dati Personali</a></h4>

        <h4>Esegui Donazione</h4>
        <div class="esegui-donazione">
            <form action="../../DonationServlet" method="post">
                <input type="number" name="amount" id="amount" min="0.00" step="0.01" placeholder="0.00 EUR" class="donazione-number-input" />
                <input type="submit" value="Manda" class="button" />
            </form>
        </div>

        <!--pulsante logout-->
        <div class="logout">
            <form action="../../LogoutServlet" method="get">
                <button class="button "type="submit"> Logout </button>
            </form>
        </div>

    </div>
</div>

<%
    String message = request.getParameter("message");
    if (message != null && !message.isEmpty()) {
        if (message.equals("Donazione riuscita")) {
%>
<script>
    //mostra poup
    function showPopup() {
        var popup = document.getElementById('custom-popup');
        popup.style.display = 'flex';
    }

    window.onload = function() {
        showPopup();
    };
</script>
<%
} else {
%>
<script>
    //mostra poup
    function showPopup() {
        var popup = document.getElementById('custom-popup');
        popup.style.display = 'flex';
    }

    window.onload = function() {
        showPopup();
    };
</script>
<%
        }
    }
%>

<!-- Popup personalizzato -->
<div id="custom-popup" style="display: none;">
    <div class="popup-content">
        <h3 id="popup-message"><%= message %></h3>
        <button onclick="closePopup()">Chiudi</button>
    </div>
</div>

<script>
    // Funzione per chiudere il popup
    function closePopup() {
        var popup = document.getElementById('custom-popup');
        popup.style.display = 'none';
    }
</script>
