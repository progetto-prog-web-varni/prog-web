<!-- Components for lateral navbar -->

<div class="simp-container-item">
    <h1 class="ris-menu-title">Menu Aderente</h1>
    <div>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/comune/dati_personali.jsp">Visualizza Dati Personali</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/comune/iscrizione_attivita.jsp">Iscrizione Attivita' dell'associazione</a></h4>
        <h4><a href="${pageContext.request.contextPath}/AreaRiservata/comune/cancella_iscrizione.jsp">Cancella Iscrizione Al sito</a></h4>

        <h4>Esegui Donazione</h4>
        <div class="ris-esegui-donazione">
            <form action="">
                <input type="number" name="donazione_value" id="donazione_value"
                       min="0,00" step="0,01"
                       placeholder="0,00 EUR" class="donazione-number-input" />
                <input type="button" value="Manda" class="button" />
            </form>
        </div>

    </div>
</div>