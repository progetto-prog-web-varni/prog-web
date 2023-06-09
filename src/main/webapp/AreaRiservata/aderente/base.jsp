<!-- Components for lateral navbar -->
<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Aderente</h1>
    <div>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/comune/dati_personali.jsp;jsessionid=<%= session.getId() %>">Visualizza Dati Personali</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/comune/iscrizione_attivita.jsp;jsessionid=<%= session.getId() %>">Iscrizione Attivita' dell'associazione</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/comune/cancella_iscrizione.jsp;jsessionid=<%= session.getId() %>">Cancella Iscrizione Al sito</a></h4>

        <h4>Esegui Donazione</h4>
        <div class="ris-esegui-donazione">
            <form action="../../DonationServlet" method="post">
                <input type="number" name="amount" id="amount" min="0.00" step="0.01" placeholder="0.00 EUR" class="donazione-number-input" />
                <input type="submit" value="Manda" class="button" />
            </form>
        </div>
    </div>
</div>

<%
    String message = (String) request.getParameter("message");
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

<style>
    /* Stile per il popup */
    #custom-popup {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        align-items: center;
        justify-content: center;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .popup-content {
        background-color: #c3e6c9;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
    }

    #popup-message {
        font-size: 18px;
        color: #145214;
    }
</style>

<script>
    // Funzione per chiudere il popup
    function closePopup() {
        var popup = document.getElementById('custom-popup');
        popup.style.display = 'none';
    }
</script>
