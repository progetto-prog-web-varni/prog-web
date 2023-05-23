<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- Check if login, se no redirect --%>
<%-- Check if Simpatizzante anche, se no da rimandare indietro --%>
<!-- BODY of web page -->
    <!-- Static components: Aderente -->
    <div class="simp-container-item">
        <h1 class="ris-menu-title">Menu Aderente</h1>
        <div>
            <h4><a href="#">Visualizza Dati Personali</a></h4>
            <h4><a href="#">Iscrizione Attività dell'associazione</a></h4>
            <h4><a href="#">Cancella Iscrizione Al sito</a></h4>

            <div class="ris-esegui-donazione">
                <h4>Esegui Donazione</h4>
                <form action="">
                    <input type="number" name="donazione_value" id="donazione_value" 
                        min="0,00" step="0,01" 
                        placeholder="0,00 EUR" class="donazione-number-input" />
                    <input type="button" value="Manda" class="button" />
                </form>
            </div>

        </div>
    </div>
    <div>
        <!-- Qui vanno tutti i dati dinamici in base a quello cliccato --> 
        <h1>Second</h1>
    </div>
